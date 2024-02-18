from unittest import mock

import pytest
from common.date_utils import time_now
from factory import Faker
from factory.fuzzy import FuzzyFloat, FuzzyText
from gocardless.tables import BankConnections, BankIBAN


@pytest.fixture
def mock_get_access_token():
    with mock.patch(
        "gocardless.base_service.GoCardlessService._get_client_access_token",
        return_value="access_token",
    ) as mocked:
        mocked.token = "access_token"
        yield mocked


@pytest.fixture
def bank_connection_factory(base_factory):
    class BankConnectionFactory(base_factory):
        class Meta:
            model = BankConnections

        institution_id = FuzzyText()
        max_historical_days = 360
        access_valid_for_days = 180

    return BankConnectionFactory


@pytest.fixture
def bank_iban_factory(base_factory):
    class BankIBANFactory(base_factory):
        class Meta:
            model = BankIBAN

        id = Faker("uuid4")
        iban = FuzzyText()
        owner_name = FuzzyText()

        account_created = time_now()

        bank_name = FuzzyText()
        bank_logo = ""
        balance = FuzzyFloat(100)

    return BankIBANFactory
