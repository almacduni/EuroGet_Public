from unittest import mock

from fastapi.testclient import TestClient
from users.tables import User


class TestResetApplicant:
    async def test__ok(
        self,
        user_client: TestClient,
        user: User,
        kyc_data_factory,
    ):
        # Arrange: prepare user and API mocks
        applicant_id = "fake_id"
        await kyc_data_factory(user_id=user.id, sumsub_id=applicant_id)
        user_id = str(user.id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(return_value=(200, {}))

            # Act: make a request
            response = user_client.post(
                "/kyc/reset_applicant",
                json={
                    "user_id": user_id,
                },
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path=f"/resources/applicants/{applicant_id}/reset",
            )

        # 2. check response
        response_data = response.json()
        assert response_data["status"] == "success"

    async def test__sumsub_error(
        self,
        user_client: TestClient,
        user: User,
        kyc_data_factory,
    ):
        # Arrange: prepare user and API mocks
        applicant_id = "fake_id"
        await kyc_data_factory(user_id=user.id, sumsub_id=applicant_id)
        user_id = str(user.id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(
                return_value=(400, {"error": "Some error"})
            )

            # Act: make a request
            response = user_client.post(
                "/kyc/reset_applicant",
                json={
                    "user_id": user_id,
                },
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "POST",
                path=f"/resources/applicants/{applicant_id}/reset",
            )

        # 2. check response
        assert response.status_code == 400
        response_data = response.json()
        assert "error" in response_data["detail"]

    async def test_error__no_applicant_id(
        self,
        user_client: TestClient,
        user: User,
    ):
        # Arrange: prepare user and API mocks
        user_id = str(user.id)

        # Act: make a request
        response = user_client.post(
            "/kyc/reset_applicant",
            json={
                "user_id": user_id,
            },
        )

        # Assert: check response
        assert response.status_code == 403
