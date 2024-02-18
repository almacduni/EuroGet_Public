from unittest import mock

from fastapi.testclient import TestClient
from kyc.tables import KYCData
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestCreateKYCLink:
    async def test__ok(
        self,
        session: AsyncSession,
        user_client: TestClient,
        user: User,
        kyc_data_factory,
    ):
        # Arrange: prepare user and API mocks
        await kyc_data_factory(
            user_id=user.id,
        )
        user_id = str(user.id)
        link = "https://link.to/somewhere"

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(return_value=(200, {"url": link}))

            # Act: make a request
            response = user_client.post(
                "/kyc/create_kyc_link",
                json={
                    "user_id": user_id,
                    "level_name": "test_level",
                    "lang": "en",
                },
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path="/resources/sdkIntegrations/levels/test_level/websdkLink",
                data={
                    "externalUserId": user_id,
                    "lang": "en",
                    "ttlInSecs": 600,
                },
            )

        # 2. check response
        response_data = response.json()
        assert response_data["kyc_link"] == link

        # 3. check data is in DB
        result = await session.execute(select(KYCData.link).where(KYCData.user_id == user_id))
        assert result.one()[0] == link

    async def test__sumsub_error(
        self,
        user_client: TestClient,
        user: User,
    ):
        # Arrange: prepare user and API mocks
        user_id = str(user.id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(
                return_value=(400, {"error": "Something wrong"})
            )

            # Act: make a request
            response = user_client.post(
                "/kyc/create_kyc_link", json={"user_id": user_id, "level_name": "test_level"}
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path="/resources/sdkIntegrations/levels/test_level/websdkLink",
                data={
                    "externalUserId": user_id,
                    "lang": "en",
                    "ttlInSecs": 600,
                },
            )

        # 2. check response
        assert response.status_code == 400
        response_data = response.json()
        assert "error" in response_data["detail"]
