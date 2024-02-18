import hashlib
import hmac

from common.cached_tokens_service import BaseApiClient, BaseApiError, Tokens
from common.logging_utils import get_logger
from settings import Settings

# TODO: fix issue w/ typechecking for both of tokens
AccessToken = str
RefreshToken = str

logger = get_logger(__name__)


class GoCardlessHttpClient(BaseApiClient):
    def __init__(self):
        self.settings = Settings()
        super().__init__(base_url=self.settings.gocardless.base_url)

    async def obtain_token(self) -> Tokens:
        data = await self.request(
            method="POST",
            path="/api/v2/token/new/",
            data={
                "secret_id": self.settings.gocardless.secret_id,
                "secret_key": self.settings.gocardless.secret_key,
            },
        )

        return Tokens(
            access_token=data["access"],
            refresh_token=data["refresh"],
            expires_in=data.get("access_expires", 0),
        )

    async def refresh_token(self, refresh_token: str) -> Tokens:
        data = await self.request(
            method="POST",
            path="/api/v2/token/refresh/",
            data={"refresh": refresh_token},
        )

        if not data or "access" not in data:
            logger.error("Key 'access' not found in response", data=data)
            raise BaseApiError(status=400, data=data)

        return Tokens(
            access_token=data["access"],
            refresh_token=refresh_token,
            expires_in=data.get("access_expires", 0),
        )

    async def check_is_token_valid(self, access_token: str) -> bool:
        """We're making random request to check if access token is ok"""
        try:
            await self.request(
                method="GET",
                path="/api/v2/institutions/",
                access_token=access_token,
            )
        except BaseApiError:
            return False

        return True

    def verify_webhook_signature(self, signature: str, request_body: bytes) -> bool:
        # Compute the hash using the HMAC algorithm
        digest = hmac.new(
            self.settings.gocardless.secret_key.encode(), request_body, hashlib.sha256
        )

        # Compare the computed hash with the received hash
        return hmac.compare_digest(signature, digest.hexdigest())
