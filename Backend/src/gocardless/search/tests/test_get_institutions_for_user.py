import uuid
from unittest import mock

from fastapi.testclient import TestClient
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestGetBankIbansByUserId:
    async def test__no_results(
        self,
        user_client: TestClient,
        user: User,
    ):
        user_id = str(user.id)

        # Act: make a request
        response = user_client.post(
            "/gc/search/institutions-for-user",
            json={"user_id": user_id},
        )
        assert response.status_code == 404

        # 2. check response
        data = response.json()
        assert data["detail"] == "No bank IBANs founded"

    async def test__ok(
        self,
        user_client: TestClient,
        user: User,
        session: AsyncSession,
        bank_connection_factory,
        bank_iban_factory,
        mock_get_access_token,
    ):
        # Arrange: prepare mocks
        user_id = str(user.id)
        mock_data = {
            "id": str(uuid.uuid4()),
            "name": "some fancy name",
            "logo_url": "mock logo url",
        }
        bank_connection = await bank_connection_factory(user_id=user_id)
        await bank_iban_factory(bank_connection=bank_connection)

        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            return_value=mock_data,
        ) as mock_request:
            # Act: make a request
            response = user_client.post(
                "/gc/search/institutions-for-user",
                json={"user_id": user_id},
            )
            assert response.status_code == 201

            # Assert: 1. check calls to gocardless service
            mock_request.assert_awaited_once_with(
                method="GET",
                path=f"/api/v2/institutions/{bank_connection.institution_id}/",
                access_token=mock_get_access_token.token,
            )

        # 2. check response
        data = response.json()
        assert data[0] == mock_data
