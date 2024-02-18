from collections import namedtuple
from unittest import mock

from fastapi.testclient import TestClient
from gocardless.tables import PaymentUsers
from gocardless_pro.errors import ValidationFailedError
from sqlalchemy import select
from users.tables import AccountInfo, User


class TestCreateMandate:
    async def test_successful(
        self,
        user: User,
        session,
        payment_users_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(AccountInfo.__tablename__)
        await payment_users_data_factory(
            user_id=user.id, p_customer_id=mock_id, p_bank_account_id=mock_id, p_mandate_id=""
        )
        new_mandate = namedtuple("new_mandate", "id")

        with (
            mock.patch(
                "gocardless_pro.services.MandatesService.create",
                return_value=new_mandate(mock_id),
            ),
        ):
            response = user_client.post(
                "gc/p/create_mandate",
                json={
                    "user_id": user_id,
                    "bank_account_id": mock_id,
                },
            )

        assert response.status_code == 201
        assert response.json()["mandate_id"] == mock_id

        query = select(
            PaymentUsers.p_mandate_id,
        ).where(PaymentUsers.p_bank_account_id == mock_id)
        raw_result = await session.execute(query)
        p_mandate_id = raw_result.one()

        assert p_mandate_id[0] == (mock_id)

    async def test_bank_account_is_not_found(
        self,
        user: User,
        user_client: TestClient,
        truncate,
    ):
        user_id = str(user.id)
        await truncate(PaymentUsers.__tablename__)

        response = user_client.post(
            "gc/p/create_mandate",
            json={
                "user_id": user_id,
                "bank_account_id": user_id,
            },
        )

        assert response.status_code == 403

    async def test_mandate_aready_exists(
        self,
        user: User,
        user_client: TestClient,
        payment_users_data_factory,
        truncate,
    ):
        user_id = str(user.id)
        await truncate(PaymentUsers.__tablename__)
        await payment_users_data_factory(
            user_id=user.id, p_customer_id=user_id, p_bank_account_id=user_id, p_mandate_id=user_id
        )

        response = user_client.post(
            "gc/p/create_mandate",
            json={
                "user_id": user_id,
                "bank_account_id": user_id,
            },
        )

        assert response.status_code == 409

    async def test_validation_failed_error(
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
            user_id=user.id, p_customer_id=mock_id, p_bank_account_id=mock_id, p_mandate_id=""
        )

        with (
            mock.patch(
                "gocardless_pro.services.MandatesService.create",
                side_effect=ValidationFailedError(error={"message": "mock error"}),
            ),
        ):
            response = user_client.post(
                "gc/p/create_mandate",
                json={
                    "user_id": user_id,
                    "bank_account_id": mock_id,
                },
            )

        assert response.status_code == 400
