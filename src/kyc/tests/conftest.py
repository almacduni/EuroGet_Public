import pytest
from common.factories import *  # noqa: F403
from common.fixtures import *  # noqa: F403
from factory.fuzzy import FuzzyText
from kyc.services import KYCService
from kyc.tables import KYCData


@pytest.fixture  # noqa: F405
async def kyc_service(session) -> KYCService:
    yield KYCService(session)


@pytest.fixture
def kyc_data_factory(base_factory):
    class KYCDataFactory(base_factory):
        class Meta:
            model = KYCData

        sumsub_id = FuzzyText()

    return KYCDataFactory
