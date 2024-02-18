from unittest import mock

from fastapi.testclient import TestClient
from kyc.tables import KYCData
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestCreateApplicant:
    async def test__ok(
        self,
        session: AsyncSession,
        user_client: TestClient,
        user: User,
    ):
        # Arrange: prepare user and API mocks
        applicant_id = "fake_id"
        user_id = str(user.id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(return_value=(200, {"id": applicant_id}))

            # Act: make a request
            response = user_client.post(
                "/kyc/create_applicant", json={"user_id": user_id, "level_name": "test_level"}
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path="/resources/applicants?levelName=test_level",
                data={"externalUserId": user_id},
            )

        # 2. check response
        response_data = response.json()
        assert response_data["applicant_id"] == applicant_id

        # 3. check data is in DB
        result = await session.execute(select(KYCData.sumsub_id).where(KYCData.user_id == user_id))
        assert result.one()[0] == applicant_id

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
                "/kyc/create_applicant", json={"user_id": user_id, "level_name": "test_level"}
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path="/resources/applicants?levelName=test_level",
                data={"externalUserId": user_id},
            )

        # 2. check response
        assert response.status_code == 400
        response_data = response.json()
        assert "error" in response_data["detail"]

    async def test__upsert_ok(
        self,
        user_client: TestClient,
        session: AsyncSession,
        user: User,
        kyc_data_factory,
    ):
        # Arrange: prepare user, applicant and API mocks
        await kyc_data_factory(user_id=user.id, sumsub_id="fake_id")
        applicant_id = "new_fake_id"
        user_id = str(user.id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(return_value=(200, {"id": applicant_id}))

            # Act: make a request
            response = user_client.post(
                "/kyc/create_applicant", json={"user_id": user_id, "level_name": "test_level"}
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path="/resources/applicants?levelName=test_level",
                data={"externalUserId": user_id},
            )

        # 2. check response
        response_data = response.json()
        assert response_data["applicant_id"] == applicant_id

        # 3. check data is in DB
        result = await session.execute(select(KYCData.sumsub_id).where(KYCData.user_id == user_id))
        assert result.one()[0] == applicant_id
