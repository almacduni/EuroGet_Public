from datetime import datetime, timezone
from unittest import mock

import pytest
from common.constants import APPLICATION_JSON
from httpx import Response
from kyc.client import SumSubClient
from settings import Settings


class TestSumSubClient:
    @pytest.mark.parametrize("api_status", [200, 400])
    async def test_signed_request(self, api_status):
        # Arrange: create client
        client = SumSubClient()
        settings = Settings()

        ts = 1000000
        signature = "mock_signature"
        client._generate_signature = mock.MagicMock(return_value=(ts, signature))

        # Act: make a request
        with mock.patch(
            "kyc.client.httpx.AsyncClient.request",
            return_value=Response(status_code=api_status, json={"foo": "bar"}),
        ) as http_client_mock:
            status, data = await client.signed_request("POST", "/some-path", {"some": "data"})

        # Assert: check response and mock call
        http_client_mock.assert_awaited_once_with(
            method="POST",
            url="https://api.sumsub.com/some-path",
            json={"some": "data"},
            headers={
                "Accept": APPLICATION_JSON,
                "Content-Type": APPLICATION_JSON,
                "X-App-Token": settings.sumsub.app_token,
                "X-App-Access-Sig": signature,
                "X-App-Access-Ts": ts,
            },
        )

        assert status == api_status
        assert data == {"foo": "bar"}

    def test_verify_signature(self):
        # Arrange: create client
        client = SumSubClient()

        # Act
        result = client.verify_signature(
            "186c7362a3c91b61eee3a2bdf962466db6042e77", b"example body"
        )

        # Assert
        assert result is True

    def test_generate_signature(self, freezer):
        # Arrange: create client, set a time
        client = SumSubClient()
        freezer.move_to(datetime.fromtimestamp(1704247419, tz=timezone.utc))

        # Act
        timestamp, signature = client._generate_signature("POST", "/some-path", {"foo": "bar"})

        # Assert
        assert int(timestamp) > 0
        assert signature == "bc2ced7564c95389a387a5a2f6bf65c3eb71645eb43cc910d677506d3fa0a735"
