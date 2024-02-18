from collections import namedtuple
from unittest import mock

from fastapi.testclient import TestClient
from gocardless.tables import PaymentUsers
from users.account_info.services import AccountInfoDoesntExist
from users.tables import AccountInfo, User


class TestCreateCustomer:
    async def test_successful(
        self,
        user: User,
        account_info_data_factory,
        truncate,
        user_client: TestClient,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        await truncate(AccountInfo.__tablename__)
        await account_info_data_factory(user_id=user.id)
        customer = namedtuple("customer", "id attributes")

        with (
            mock.patch(
                "gocardless_pro.services.CustomersService.create",
                return_value=customer(user_id, "some attributes"),
            ),
        ):
            response = user_client.post(
                "gc/p/create_customer",
                json={
                    "user_id": user_id,
                },
            )

            assert response.status_code == 201
            assert response.json()["p_customer_id"] == user_id

    async def test_customer_already_exists(
        self,
        user: User,
        payment_users_data_factory,
        truncate,
        user_client: TestClient,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        await truncate(PaymentUsers.__tablename__)
        await payment_users_data_factory(user_id=user.id, p_customer_id=user_id)

        response = user_client.post(
            "gc/p/create_customer",
            json={
                "user_id": user_id,
            },
        )

        assert response.status_code == 200
        assert response.json()["detail"] == user_id

    async def test_account_info_doesnt_exist(
        self, user: User, truncate, user_client: TestClient, mock_get_access_token
    ):
        user_id = str(user.id)
        await truncate(PaymentUsers.__tablename__)

        with (
            mock.patch(
                "gocardless_pro.services.CustomersService.create",
                side_effect=AccountInfoDoesntExist(),
            ),
        ):
            response = user_client.post(
                "gc/p/create_customer",
                json={
                    "user_id": user_id,
                },
            )

            assert response.status_code == 403
