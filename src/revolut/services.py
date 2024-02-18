from common.cached_tokens_service import BaseApiClient, CachedTokensService
from db import Base
from revolut.client import RevolutHttpClient
from revolut.tables import RevolutAPITokens


class RevolutService(CachedTokensService):
    """
    Service to perform operations with Revolut Business API
    """

    def create_api_client(self) -> BaseApiClient:
        return RevolutHttpClient()

    def get_table(self) -> Base:
        return RevolutAPITokens
