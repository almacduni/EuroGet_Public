from datetime import datetime
from decimal import Decimal
from typing import Optional

from common.services import Service
from gocardless.payments.services import (
    GoCardlessAPIValidationError,
    GoCardlessPaymentsService,
)
from loans.constants import (
    COMMISSION_RATES,
    LoanType,
    PaymentStatus,
    TransferType,
)
from loans.tables import IssuedLoans, UserLoadManagement
from pydantic import BaseModel, model_validator
from sqlalchemy import insert, select, update
from sqlalchemy.exc import NoResultFound
from sqlalchemy.sql.operators import and_


class UserNotFound(Exception):
    pass


class InsufficientCredit(Exception):
    pass


class LoanLimitReached(Exception):
    pass


class NoInstallmentsFound(Exception):
    pass


class NoPaydayLoanFound(Exception):
    pass


class LoanTypeIsNotPayday(Exception):
    pass


class LoanRequest(BaseModel):
    loan_sum: Decimal = Decimal("0")
    transfer_type: TransferType
    mandate_id: str
    loan_type: LoanType
    charge_date: Optional[datetime]

    @model_validator(mode="after")
    def validate_charge_date_for_payday_loan(self):
        if self.loan_type == LoanType.PAYDAY_LOAN and not self.charge_date:
            raise ValueError("Missing charge date for payday loan.")
        return self


class LoanDto(BaseModel):
    message: str
    loan: Decimal
    commission: Decimal
    total_loan_amount: Decimal
    loan_type: LoanType


class PaymentDto(BaseModel):
    payment_id: str
    status: PaymentStatus
    # TODO: why timestamp here, not date?
    charge_date: int
    amount: Decimal
    paid: bool


class InstallmentDto(BaseModel):
    installment_id: str
    next_payment_date: int
    next_payment_amount: Decimal
    payments: list[PaymentDto]
    total_debt: Decimal
    confirmed_debt: Decimal
    outstanding_debt: Decimal
    is_paid: bool
    type: LoanType


class UserInstallmentsDto(BaseModel):
    # TODO: switch to date
    next_payment_date: int
    next_payment_amount: Decimal
    installments: list[InstallmentDto]


class PaydayLoanDto(BaseModel):
    loan_id: str
    is_paid: bool
    payment_id: str
    payment_status: PaymentStatus
    total_sum: Decimal
    type: LoanType


class LoanManagementService(Service):
    async def process_loan_request(self, user_id: str, loan_request: LoanRequest) -> LoanDto:
        # TODO: think about transaction here
        # Calculate total loan sum with commission
        commission = COMMISSION_RATES[loan_request.transfer_type]
        total_loan_sum = loan_request.loan_sum + commission

        # Fetch user loan management data including 'active_loans_count'
        query = select(
            UserLoadManagement.current_limit,
            UserLoadManagement.active_loan,
            UserLoadManagement.total_loan_taken,
            UserLoadManagement.active_loans_count,
        ).where(UserLoadManagement.user_id == user_id)
        try:
            raw_result = await self.session.execute(query)
            (
                current_limit,
                active_loan,
                total_loan_taken,
                active_loans_count,
            ) = raw_result.one()
        except NoResultFound:
            raise UserNotFound()

        credit_limit = current_limit or 0
        active_loan = active_loan or 0
        total_loan_taken = total_loan_taken or 0
        active_loans_count = active_loans_count or 0

        # Check if the requested loan, including commission, is within the available credit limit
        sum_available = credit_limit - active_loan
        if sum_available < total_loan_sum:
            raise InsufficientCredit()

        # Ensure active_loans_count is an integer
        if active_loans_count >= 2:
            raise LoanLimitReached()

        # If all conditions are met, proceed with the loan issuance
        new_loan_amount = active_loan + total_loan_sum
        new_total_loan_taken = total_loan_taken + total_loan_sum
        new_active_loans_count = active_loans_count + 1

        # Update the database with the new loan data and increment the 'active_loans_count'
        await self.session.execute(
            update(UserLoadManagement)
            .values(
                active_loan=new_loan_amount,
                total_loan_taken=new_total_loan_taken,
                active_loans_count=new_active_loans_count,
            )
            .where(UserLoadManagement.user_id == user_id)
        )

        gc_service = GoCardlessPaymentsService(self.session)

        if loan_request.loan_type == LoanType.PAYDAY_LOAN:
            # Prepare the payment request data
            amount_in_cents = int(total_loan_sum * 100)  # Convert to cents and cast to integer

            # Call the process_payday_loan_payment function directly with the required data
            try:
                payment = await gc_service.process_payday_loan_payment(
                    amount_in_cents=amount_in_cents,
                    mandate_id=loan_request.mandate_id,
                    charge_date=loan_request.charge_date,
                )
            except GoCardlessAPIValidationError:
                raise

            # Log the issued loan with the type, payment_id, and payment_status for payday loans
            await self.session.execute(
                insert(IssuedLoans).values(
                    user_id=user_id,
                    sum=loan_request.loan_sum,
                    commission=commission,
                    total_sum=total_loan_sum,
                    type=loan_request.loan_type,
                    payment_id=payment.id,
                    payment_status=payment.id,
                    is_paid=False,
                )
            )

        return LoanDto(
            message="Loan granted.",
            loan=loan_request.loan_sum,
            commission=commission,
            total_loan_amount=total_loan_sum,
            loan_type=loan_request.loan_type,
        )

    # async def get_installment_details(self, user_id: str, installment_id: str) -> InstallmentDto:
    #     # Verify if the installment belongs to the user.
    #     try:
    #         raw_result = await self.session.execute(
    #             select(
    #                 IssuedLoans.instalment_id,
    #             ).where(
    #                 and_(
    #                     IssuedLoans.user_id == user_id,
    #                     IssuedLoans.installment_id == installment_id,
    #                 )
    #             )
    #         )
    #         raw_result.one()
    #     except NoResultFound:
    #         raise NoInstallmentsFound()

    #     # Fetch all payments for the current installment_id
    #     try:
    #         raw_result = await self.session.execute(
    #             select(
    #                 InstallmentPayments.status,
    #                 InstallmentPayments.payment_amount,
    #                 InstallmentPayments.charge_date,
    #                 InstallmentPayments.payment_id,
    #             )
    #             .where(InstallmentPayments.instalment_id == installment_id)
    #             .order_by("charge_date")
    #         )
    #         payments = raw_result.fetchall()
    #     except NoResultFound:
    #         payments = []

    #     total_debt = 0
    #     confirmed_debt = 0
    #     payment_data = []
    #     current_date = time_now()  # Current date-time in UTC

    #     next_payment_date = None
    #     next_payment_amount = 0

    #     for payment in payments:
    #         is_paid = payment.status == PaymentStatus.CONFIRMED
    #         payment_amount_dollars = payment.payment_amount / 100  # converting to dollars
    #         total_debt += payment_amount_dollars
    #         if is_paid:
    #             confirmed_debt += payment_amount_dollars

    #         if (
    #             not is_paid
    #             and payment.charge_date > current_date
    #             and (next_payment_date is None or payment.charge_date < next_payment_date)
    #         ):
    #             next_payment_date = payment.charge_date
    #             next_payment_amount = payment_amount_dollars

    #         payment_data.append(
    #             PaymentDto(
    #                 payment_id=payment.payment_id,
    #                 status=payment.status,
    #                 charge_date=date_to_unix(payment.charge_date),
    #                 amount=payment_amount_dollars,
    #                 paid=is_paid,
    #             )
    #         )

    #     outstanding_debt = total_debt - confirmed_debt

    #     return InstallmentDto(
    #         type=LoanType.INSTALLMENT,
    #         installment_id=installment_id,
    #         next_payment_date=date_to_unix(next_payment_date),
    #         next_payment_amount=Decimal(next_payment_amount),
    #         payments=payment_data,
    #         total_debt=Decimal(total_debt),
    #         confirmed_debt=Decimal(confirmed_debt),
    #         outstanding_debt=Decimal(outstanding_debt),
    #         is_paid=all(p.status == PaymentStatus.CONFIRMED for p in payments),
    #     )

    async def get_payday_details_by_user_payment(
        self, user_id: str, payment_id: str
    ) -> PaydayLoanDto:
        try:
            raw_result = await self.session.execute(
                select(
                    IssuedLoans.loan_id,
                    IssuedLoans.type,
                    IssuedLoans.payment_id,
                    IssuedLoans.total_sum,
                    IssuedLoans.payment_status,
                    IssuedLoans.is_paid,
                ).where(and_(IssuedLoans.payment_id == payment_id, IssuedLoans.user_id == user_id))
            )
            loan = raw_result.one()
        except NoResultFound:
            raise NoPaydayLoanFound()

        # Check if the loan is a payday loan.
        if loan.type != LoanType.PAYDAY_LOAN:
            raise LoanTypeIsNotPayday()

        return PaydayLoanDto(
            loan_id=loan.loan_id,
            is_paid=loan.is_paid,
            payment_id=loan.payment_id,
            payment_status=loan.payment_status,
            total_sum=loan.total_sum,
            type=loan.type,
        )
