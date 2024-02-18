from common.cached_tokens_service import CachedTokensService
from db import Base
from gocardless.client import GoCardlessHttpClient
from gocardless.tables import GoCardlessTokens


class GoCardlessService(CachedTokensService):
    """
    Base class for GoCardless services
    """

    def create_api_client(self) -> GoCardlessHttpClient:
        return GoCardlessHttpClient()

    def get_table(self) -> Base:
        return GoCardlessTokens
