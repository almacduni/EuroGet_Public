from unittest import mock

from common.cached_tokens_service import Tokens
from gocardless.base_service import GoCardlessService
from gocardless.tables import GoCardlessTokens
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession


class TestBaseGoCardlessService:
    async def test_obtain_new_token(self, session: AsyncSession):
        # Arrange
        service = GoCardlessService(session)

        # Act: make a call
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.obtain_token",
            return_value=Tokens(
                access_token="test_access_token",
                refresh_token="test_refresh_token",
                expires_in=100,
            ),
        ):
            access_token = await service._get_client_access_token()

        # Assert: check API called and tokens stored in DB
        assert access_token == "test_access_token"
        result = await session.execute(
            select(
                GoCardlessTokens.access_token,
                GoCardlessTokens.refresh_token,
                GoCardlessTokens.is_valid,
            )
        )
        assert result.one() == ("test_access_token", "test_refresh_token", True)

    async def test_check_token(self, session, api_token_factory):
        # Arrange: create pair of tokens
        service = GoCardlessService(session)
        await api_token_factory()

        # Act: make a call
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.check_is_token_valid", return_value=True
        ) as client_mock:
            await service._get_client_access_token()

        # Assert: check that check API called
        client_mock.assert_awaited_once()

    async def test_refresh_token(self, session: AsyncSession, api_token_factory, truncate):
        # Arrange: create pair of tokens
        service = GoCardlessService(session)
        await truncate(GoCardlessTokens.__tablename__)
        stored_token = await api_token_factory()

        # Act: make a call (check should be invalid)
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.check_is_token_valid", return_value=False
        ), mock.patch(
            "gocardless.client.GoCardlessHttpClient.refresh_token",
            return_value=Tokens(
                access_token="test_access_token",
                refresh_token=stored_token.refresh_token,
                expires_in=100,
            ),
        ) as refresh_mock:
            access_token = await service._get_client_access_token()

        # Assert: check that check API called
        refresh_mock.assert_awaited_once()
        assert access_token == "test_access_token"
        result = await session.execute(
            select(
                GoCardlessTokens.access_token,
                GoCardlessTokens.refresh_token,
                GoCardlessTokens.is_valid,
            ).order_by(GoCardlessTokens.created_at)
        )
        assert [
            (mock.ANY, mock.ANY, False),
            ("test_access_token", stored_token.refresh_token, True),
        ] == result.all()
