from unittest import mock

from gocardless.client import GoCardlessHttpClient
from settings import Settings


class TestGoCardlessHttpClient:
    async def test_create_access_token(self):
        # Arrange: create client
        client = GoCardlessHttpClient()
        settings = Settings()

        # Act: make a request
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            return_value={"access": "foo", "refresh": "bar", "access_expires": 100},
        ) as http_client_mock:
            tokens = await client.obtain_token()

        http_client_mock.assert_awaited_once_with(
            method="POST",
            path="/api/v2/token/new/",
            data={
                "secret_id": settings.gocardless.secret_id,
                "secret_key": settings.gocardless.secret_key,
            },
        )

        # Assert
        assert tokens.access_token == "foo"
        assert tokens.refresh_token == "bar"

    async def test_refresh_access_token(self):
        # Arrange: create client
        client = GoCardlessHttpClient()

        refresh_token = "foobar_refresh"
        # Act: make a request
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            return_value={"access": "foo"},
        ) as http_client_mock:
            tokens = await client.refresh_token(refresh_token)

        http_client_mock.assert_awaited_once_with(
            method="POST",
            path="/api/v2/token/refresh/",
            data={"refresh": refresh_token},
        )

        # Assert
        assert tokens.access_token == "foo"
        assert tokens.refresh_token == "foobar_refresh"

    async def test_check_is_token_valid(self):
        # Arrange: create client
        client = GoCardlessHttpClient()

        access_token = "foobar_access"
        # Act: make a request
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            return_value={"some": "data"},
        ) as http_client_mock:
            is_valid = await client.check_is_token_valid(access_token)

        http_client_mock.assert_awaited_once_with(
            method="GET",
            path="/api/v2/institutions/",
            access_token=access_token,
        )

        # Assert
        assert is_valid is True

    def test_verify_webhook_signature(self):
        # Arrange: create client
        client = GoCardlessHttpClient()

        # Act
        result = client.verify_webhook_signature(
            "d3f5cebc6f075768b217bab022b61719a722d810ea2699493fbc7f295f5021cc", b"example body"
        )

        # Assert
        assert result is True
