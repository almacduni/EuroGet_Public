import datetime

import pytest
from common.factories import *  # noqa: F403
from common.fixtures import *  # noqa: F403
from factory.fuzzy import FuzzyDate, FuzzyFloat, FuzzyInteger, FuzzyText
from gocardless.payments.services import GoCardlessPaymentsService
from gocardless.tables import PaymentUsers
from gocardless.tests.fixtures import *  # noqa: F403
from loans.tables import IssuedLoans
from users.tables import AccountInfo


@pytest.fixture
async def payments_service(session) -> GoCardlessPaymentsService:
    yield GoCardlessPaymentsService(session)


@pytest.fixture
def account_info_data_factory(base_factory):
    class AccountInfoDataFactory(base_factory):
        class Meta:
            model = AccountInfo

        email = "test@email.com"
        first_name = FuzzyText()
        last_name = FuzzyText()
        birth_date = FuzzyDate(datetime.date.today())
        tax_id = FuzzyText()
        address = FuzzyText()
        city = FuzzyText()
        zip_code = FuzzyText()
        country_code = FuzzyText()
        country = FuzzyText()
        education = "NONE"
        car_ownership = True
        employment_info = "UNEMPLOYED"
        monthly_income = FuzzyInteger(low=0)

    return AccountInfoDataFactory


@pytest.fixture
def payment_users_data_factory(base_factory):
    class PaymentUsersDataFactory(base_factory):
        class Meta:
            model = PaymentUsers

        p_bank_account_id = FuzzyText()
        p_mandate_id = FuzzyText()
        iban = FuzzyText()
        mandate_status = FuzzyText()

    return PaymentUsersDataFactory


@pytest.fixture
def issued_loans_data_factory(base_factory):
    class IssuedLoansDataFactory(base_factory):
        class Meta:
            model = IssuedLoans

        sum = FuzzyFloat(low=1)
        date = FuzzyDate(datetime.date.today())
        is_paid = False
        instalment_id = FuzzyText()
        commission = FuzzyFloat(low=1)
        total_sum = FuzzyFloat(low=1)
        payment_id = FuzzyText()
        payment_status = FuzzyText()
        type = "payday_loan"

    return IssuedLoansDataFactory
