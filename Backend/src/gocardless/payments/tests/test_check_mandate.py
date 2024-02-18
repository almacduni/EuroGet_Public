from collections import namedtuple
from unittest import mock

from fastapi.testclient import TestClient
from gocardless.tables import PaymentUsers
from gocardless_pro.errors import InvalidStateError
from users.tables import AccountInfo, User


class TestCheckMandate:
    async def test_successful(
        self,
        user: User,
        payment_users_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(PaymentUsers.__tablename__)
        await payment_users_data_factory(
            user_id=user.id, p_customer_id=mock_id, p_mandate_id=mock_id
        )
        mandate = namedtuple("mandate", "status")

        with (
            mock.patch(
                "gocardless_pro.services.MandatesService.get",
                return_value=mandate("STATUS"),
            ),
        ):
            response = user_client.post(
                "gc/p/check_mandate",
                json={
                    "user_id": user_id,
                    "mandate_id": mock_id,
                },
            )

        assert response.status_code == 200
        assert response.json()["mandate_id"] == mock_id
        assert response.json()["mandate_status"] == "STATUS"

    async def test_mandate_not_found(
        self,
        user: User,
        user_client: TestClient,
        truncate,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(PaymentUsers.__tablename__)

        response = user_client.post(
            "gc/p/check_mandate",
            json={
                "user_id": user_id,
                "mandate_id": mock_id,
            },
        )

        assert response.status_code == 404

    async def test_invalid_state_error(
        self,
        user: User,
        payment_users_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(AccountInfo.__tablename__)
        await payment_users_data_factory(
            user_id=user.id, p_customer_id=mock_id, p_mandate_id=mock_id
        )
        with (
            mock.patch(
                "gocardless_pro.services.MandatesService.get",
                side_effect=InvalidStateError(error={"message": "mock error"}),
            ),
        ):
            response = user_client.post(
                "gc/p/check_mandate",
                json={
                    "user_id": user_id,
                    "mandate_id": mock_id,
                },
            )

        assert response.status_code == 400
