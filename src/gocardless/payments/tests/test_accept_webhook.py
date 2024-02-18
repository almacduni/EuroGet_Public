from unittest import mock

from fastapi.testclient import TestClient
from gocardless.tables import PaymentUsers
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestAcceptWebhooks:
    async def test__ok(
        self, session: AsyncSession, client: TestClient, payment_users_data_factory, user: User
    ):
        await payment_users_data_factory(
            user_id=user.id, p_customer_id="mock_id", p_mandate_id="fake_id"
        )
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.verify_webhook_signature", return_value=True
        ):
            response = client.post(
                "/gc/webhook_endpoint",
                headers={"x-gocardless-signature": "mock_signature"},
                json={
                    "events": [
                        {
                            "action": "action",
                            "resource_type": "mandates",
                            "links": {"mandate": "fake_id"},
                        }
                    ],
                },
            )

        # Assert: check response
        assert response.status_code == 200

        async with session.begin():
            result = await session.execute(
                select(PaymentUsers.mandate_status).where(PaymentUsers.p_mandate_id == "fake_id")
            )

        assert result.one()[0] == "action"

    async def test__signature_error(self, client: TestClient):
        # Arrange: prepare API mocks
        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.verify_webhook_signature", return_value=False
        ):
            # Act: make a request
            response = client.post(
                "/gc/webhook_endpoint",
                headers={"x-gocardless-signature": "mock_signature"},
                json={},
            )

        # Assert: check response
        assert response.status_code == 400
