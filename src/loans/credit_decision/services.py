from datetime import datetime
from typing import List, Union

import pandas as pd
from common.services import Service
from gocardless.tables import BankConnects
from loans.tables import OpenBankingDataset, UserLoadManagement
from pydantic import BaseModel
from sklearn.cluster import KMeans
from sklearn.feature_extraction.text import TfidfVectorizer
from sqlalchemy import insert, select
from sqlalchemy.exc import NoResultFound
from sqlalchemy.sql.operators import and_


class TryAnotherAccount(Exception):
    pass


class ApprovalDto(BaseModel):
    approval: str
    final_probabilities: dict[float, float]


class CreditDecisionDto(BaseModel):
    bank_account_id: Union[str, ApprovalDto]


class CreditDecisionService(Service):
    async def calculate_credit_decision(
        self, user_id: str, agreement_id: str
    ) -> List[CreditDecisionDto]:
        # Fetch and filter the row using agreement_id.
        query = select(BankConnects.bank_accounts).where(BankConnects.agreement_id == agreement_id)
        raw_result = await self.session.execute(query)
        bank_account_ids = raw_result.one()[0].split(",")

        results = []

        # Loop through each bank account id and fetch corresponding transactions.
        for bank_account_id in bank_account_ids:
            query = select(OpenBankingDataset.raw_transactions).where(
                and_(
                    OpenBankingDataset.gc_account_id == bank_account_id,
                    OpenBankingDataset.user_id == user_id,
                ),
            )
            raw_result = await self.session.execute(query)
            try:
                transactions_data = raw_result.one()[0]
                # If transaction data exists proceed to call the credit decision algorithm
                final_probabilities = self._credit_decision_algorithm(transactions_data)

                if self._loan_decision(final_probabilities):
                    await self.session.execute(
                        insert(UserLoadManagement).values(
                            user_id=user_id,
                            approved=True,
                            initial_credit_decision=str(final_probabilities),
                        )
                    )

                    results.append(
                        CreditDecisionDto(
                            bank_account_id=ApprovalDto(
                                approval="Loan approved",
                                final_probabilities=final_probabilities,
                            )
                        )
                    )
                else:
                    results.append(
                        CreditDecisionDto(
                            bank_account_id=ApprovalDto(
                                approval="Loan not approved",
                                final_probabilities=final_probabilities,
                            )
                        )
                    )
            except NoResultFound:
                results.append(
                    CreditDecisionDto(
                        bank_account_id="No transaction data found for this Bank Account ID"
                    )
                )
            except ValueError as e:
                if str(e) == "Please connect another account":
                    raise TryAnotherAccount()
                else:
                    raise e
        return results

    def _loan_decision(self, final_probabilities: dict[float, float]):
        for probability in final_probabilities.values():
            if probability >= self.settings.credit_decision.limit_probability:
                return True
        return False

    def _cluster_texts(self, texts, n_clusters=5):
        # Function to perform text clustering
        vectorizer = TfidfVectorizer(max_df=0.5, min_df=0.1, stop_words="english")
        try:
            tfidf_model = vectorizer.fit_transform(texts)
        except ValueError as e:
            if str(e) == "After pruning, no terms remain. Try a lower min_df or a higher max_df.":
                raise ValueError("Please connect another account") from None
            else:
                raise e
        km_model = KMeans(n_clusters=n_clusters, n_init=10)  # Explicitly set n_init to 10
        km_model.fit(tfidf_model)
        return km_model.labels_

    def _credit_decision_algorithm(self, transactions_data):
        # Inserted previously top level code into this function,
        # preparing output for final_probabilities
        transactions_in = []
        transactions_out = []

        # Separate transactions into 'in' and 'out'
        for txn in transactions_data["transactions"]["booked"]:
            amount_str = txn.get("transactionAmount", {}).get("amount", "0")
            amount = float(amount_str)
            # currency = txn.get("transactionAmount", {}).get("currency", "EUR")
            remittance_info = txn.get("remittanceInformationUnstructured", "Unknown")
            booking_date = txn.get("bookingDate", "Unknown")

            if amount > 0:
                transactions_in.append(
                    {
                        "amount": amount,
                        "remittance_info": remittance_info,
                        "booking_date": booking_date,
                    }
                )
            elif amount < 0:
                transactions_out.append(
                    {
                        "amount": abs(amount),
                        "remittance_info": remittance_info,
                        "booking_date": booking_date,
                    }
                )
        df_in = pd.DataFrame(transactions_in)
        df_out = pd.DataFrame(transactions_out)

        df_in["booking_date"] = pd.to_datetime(df_in["booking_date"])
        df_out["booking_date"] = pd.to_datetime(df_out["booking_date"])

        # Clustering 'in' transactions
        df_in["combined_info"] = df_in["amount"].astype(str) + " " + df_in["remittance_info"]
        df_in["cluster"] = self._cluster_texts(df_in["combined_info"])

        # Identifying recurring income
        df_in_cluster_counts = df_in["cluster"].value_counts()
        recurring_income_clusters = df_in_cluster_counts[df_in_cluster_counts > 1].index.tolist()
        df_recurring_income = df_in[df_in["cluster"].isin(recurring_income_clusters)]
        filtered_recurring_income = df_recurring_income["amount"].sum()

        # Future projections based on recurring income and total expenses
        future_days = 90
        future_recurring_income = filtered_recurring_income * (future_days / 90)
        total_expenses = df_out["amount"].sum()
        future_total_expenses = total_expenses * (future_days / 90)
        future_final_balance = future_recurring_income - future_total_expenses

        # Incorporate the age of the account
        account_creation_date = pd.to_datetime("2023-09-05")  # Example date
        current_date = pd.to_datetime(datetime.now().date())
        account_age_days = (current_date - account_creation_date).days
        age_factor = account_age_days / 365

        # Multi-Currency Support
        exchange_rates = {"EUR": 1, "USD": 0.95, "GBP": 1.16}  # Example rates
        transaction_currency = transactions_data["transactions"]["booked"][0]["transactionAmount"][
            "currency"
        ]
        currency_conversion_factor = exchange_rates.get(transaction_currency, 1)
        df_in["amount"] = df_in["amount"] * currency_conversion_factor
        df_out["amount"] = df_out["amount"] * currency_conversion_factor

        # Large One-Time Transactions
        avg_in_transaction = df_in["amount"].mean()
        large_transactions = df_in[df_in["amount"] > avg_in_transaction * 2]
        large_transaction_factor = len(large_transactions) / len(df_in)

        # Error Handling
        min_transactions_required = 100
        if len(df_in) + len(df_out) < min_transactions_required:
            raise ValueError("Insufficient transaction data to make a prediction.")

        # Variable Loan Amounts
        loan_amounts = [100, 250, 500]
        final_probabilities = {}

        for loan_amount in loan_amounts:
            weight_income = 1.2
            weight_expense = 0.8
            weight_balance = 1.5
            weight_age = 0.5
            probability_cap = 0.95

            income_factor = future_recurring_income / (loan_amount + 1e-6)
            expense_factor = future_total_expenses / (loan_amount + 1e-6)
            balance_factor = future_final_balance / (loan_amount + 1e-6)

            total_weight = weight_income + weight_expense + weight_balance + weight_age
            probability_refined = (
                weight_income * income_factor
                + weight_expense * expense_factor
                + weight_balance * balance_factor
                + weight_age * age_factor
                + large_transaction_factor
            ) / total_weight

            probability_refined = min(max(probability_refined, 0), probability_cap)

            risk_tolerance_multipliers = {"Low": 0.7, "Medium": 1.0, "High": 1.3}
            assumed_risk_tolerance = "Low"
            final_probability = (
                probability_refined * risk_tolerance_multipliers[assumed_risk_tolerance]
            )
            final_probability = min(max(final_probability, 0), probability_cap)

            final_probabilities[loan_amount] = final_probability

        return final_probabilities
