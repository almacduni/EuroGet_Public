import pytest
from common.factories import *  # noqa: F403
from common.fixtures import *  # noqa: F403
from factory.fuzzy import FuzzyText
from gocardless.tables import GoCardlessTokens


@pytest.fixture
def api_token_factory(base_factory):
    class APITokenFactory(base_factory):
        class Meta:
            model = GoCardlessTokens

        access_token = FuzzyText()
        refresh_token = FuzzyText()
        expires = 100

    return APITokenFactory
