from unittest import mock

from fastapi.testclient import TestClient
from users.tables import User


class TestGetApplicantData:
    async def test__ok(
        self,
        user_client: TestClient,
        user: User,
        kyc_data_factory,
    ):
        # Arrange: prepare user and API mocks
        user_id = str(user.id)
        applicant_id = "fake_id"
        await kyc_data_factory(user_id=user.id, sumsub_id=applicant_id)

        mock_data = {
            "info": {
                "addresses": [
                    {
                        "street": "street1",
                        "town": "town1",
                        "postCode": "0000-000",
                    }
                ],
                "idDocs": [{"firstName": "foo", "lastName": "bar", "tin": "123"}],
            },
            "id": applicant_id,
            "createdAt": "2020-10-09 22:39:51",
            "externalUserId": user_id,
        }
        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(return_value=(200, mock_data))

            # Act: make a request
            response = user_client.get(
                "/kyc/get_applicant_data",
                params={
                    "user_id": user_id,
                },
            )
            assert response.status_code == 200

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once_with(
                "GET",
                path=f"/resources/applicants/{applicant_id}/one",
            )

        # 2. check response
        response_data = response.json()
        assert response_data["id"] == applicant_id
        assert response_data["user_id"] == user_id
        assert response_data["first_name"] == "foo"
        assert response_data["last_name"] == "bar"
        assert response_data["tax_id"] == "123"
        assert response_data["address"] == "street1"
        assert response_data["city"] == "town1"
        assert response_data["zip_code"] == "0000-000"
        assert response_data["created_at"] == "2020-10-09T22:39:51"

    async def test__error_no_application_id(
        self,
        user_client: TestClient,
        user: User,
    ):
        # Arrange: prepare user and API mocks
        user_id = str(user.id)

        # Act: make a request
        response = user_client.get(
            "/kyc/get_applicant_data",
            params={
                "user_id": user_id,
            },
        )

        # Assert: check response
        assert response.status_code == 403

    async def test__sumsub_error(
        self,
        user_client: TestClient,
        user: User,
        kyc_data_factory,
    ):
        # Arrange: prepare user and API mocks
        user_id = str(user.id)
        applicant_id = "fake_id"
        await kyc_data_factory(user_id=user.id, sumsub_id=applicant_id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().signed_request = mock.AsyncMock(
                return_value=(400, {"error": "Something wrong"})
            )

            # Act: make a request
            response = user_client.get(
                "/kyc/get_applicant_data",
                params={
                    "user_id": user_id,
                },
            )

            # Assert: 1. check calls to SumSub service
            sumsub_mock().signed_request.assert_awaited_once()

        # 2. check response
        assert response.status_code == 400
        response_data = response.json()
        assert "error" in response_data["detail"]
