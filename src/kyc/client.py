import hashlib
import hmac
import json
import time
from typing import Optional

import httpx
from common.constants import APPLICATION_JSON
from common.logging_utils import get_logger
from settings import Settings

logger = get_logger(__name__)


class SumSubClient:
    def __init__(self):
        self.settings = Settings()

    async def signed_request(
        self,
        method: str,
        path: str,
        data: Optional[dict] = None,
    ) -> tuple[int, Optional[dict]]:
        """
        Performs signed request to SumSub API, returns status and response
        :param method:
        :param path:
        :param data:
        :return:
        """
        data = data or {}
        timestamp, signature = self._generate_signature(method, path, data)

        async with httpx.AsyncClient() as client:
            response = await client.request(
                method=method,
                url=f"{self.settings.sumsub.base_url}{path}",
                headers={
                    "Accept": APPLICATION_JSON,
                    "Content-Type": APPLICATION_JSON,
                    # Add the necessary headers to the request
                    "X-App-Token": self.settings.sumsub.app_token,
                    "X-App-Access-Sig": signature,
                    "X-App-Access-Ts": timestamp,
                },
                json=data,
            )

        if response.status_code != 200:
            response_data = response.json()
            logger.error(f"HTTP error on SumSub API {response_data}")
            return response.status_code, response_data

        return 200, response.json()

    def _generate_signature(self, method, uri, body: dict):
        body_content = json.dumps(body)

        # Generate the timestamp in seconds
        timestamp = str(int(time.time()))

        # Create the string to be signed
        string_to_sign = timestamp + method.upper() + uri + body_content

        # Create the signature
        signature = hmac.new(
            bytes(self.settings.sumsub.secret_key, "latin-1"),
            msg=bytes(string_to_sign, "latin-1"),
            digestmod=hashlib.sha256,
        ).hexdigest()

        return timestamp, signature

    def verify_signature(self, signature: str, request_body: bytes) -> bool:
        # Compute the hash using the HMAC algorithm
        digest = hmac.new(self.settings.sumsub.secret_key.encode(), request_body, hashlib.sha1)

        # Compare the computed hash with the received hash
        return hmac.compare_digest(digest.hexdigest(), signature)
