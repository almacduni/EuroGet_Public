import pytest
from common.factories import *  # noqa: F403
from common.fixtures import *  # noqa: F403
from gocardless.bank_connect.services import GoCardlessBankConnectionService
from gocardless.tests.fixtures import *  # noqa: F403


@pytest.fixture
def service(session):
    return GoCardlessBankConnectionService(session)
