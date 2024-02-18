from common.cached_tokens_service import BaseApiClient, BaseApiError, Tokens
from common.constants import APPLICATION_FORM_ENCODED
from common.logging_utils import get_logger
from settings import Settings

logger = get_logger(__name__)


class RevolutHttpClient(BaseApiClient):
    def __init__(self):
        self.settings = Settings()
        super().__init__(base_url=self.settings.revolut.url)

    async def check_is_token_valid(self, access_token: str) -> bool:
        try:
            await self.request("GET", "/accounts", data=None, access_token=access_token)
            return True
        except BaseApiError:
            return False

    async def obtain_token(self) -> Tokens:
        """
        Returns access and refresh tokens or raise RevolutApiError
        :return:
        """
        data = await self.request(
            "POST",
            "/auth/token",
            data={
                "grant_type": "authorization_code",
                "code": self.settings.revolut.auth_code,
                "client_assertion_type": "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
                "client_assertion": self.settings.revolut.client_assertion_jwt,
            },
            content_type=APPLICATION_FORM_ENCODED,
        )
        return Tokens(
            access_token=data["access_token"],
            refresh_token=data["refresh_token"],
            expires_in=data["expires_in"],
        )

    async def refresh_token(self, refresh_token: str) -> Tokens:
        """
        Returns access and refresh tokens or raise RevolutApiError
        :return:
        """
        data = await self.request(
            "POST",
            "/auth/token",
            data={
                "grant_type": "refresh_token",
                "refresh_token": refresh_token,
                "client_assertion_type": "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
                "client_assertion": self.settings.revolut.client_assertion_jwt,
            },
            content_type=APPLICATION_FORM_ENCODED,
        )
        return Tokens(
            access_token=data["access_token"],
            refresh_token=refresh_token,
            expires_in=data["expires_in"],
        )
