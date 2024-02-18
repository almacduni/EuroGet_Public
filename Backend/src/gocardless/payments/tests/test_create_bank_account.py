from collections import namedtuple
from unittest import mock

from fastapi.testclient import TestClient
from gocardless.tables import PaymentUsers
from gocardless_pro.errors import ValidationFailedError
from sqlalchemy import select
from users.tables import AccountInfo, User


class TestCreateBankAccount:
    async def test_successful(
        self,
        user: User,
        session,
        account_info_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(AccountInfo.__tablename__)
        await account_info_data_factory(user_id=user.id)
        new_bank_account = namedtuple("new_bank_account", "id")

        with (
            mock.patch(
                "gocardless_pro.services.CustomerBankAccountsService.create",
                return_value=new_bank_account(mock_id),
            ),
        ):
            response = user_client.post(
                "gc/p/create_bank_account",
                json={
                    "user_id": user_id,
                    "customer_id": user_id,
                    "iban": user_id,
                },
            )

        assert response.status_code == 201
        assert response.json()["bank_account_id"] == mock_id

        query = select(
            PaymentUsers.iban,
            PaymentUsers.p_bank_account_id,
        ).where(PaymentUsers.user_id == user_id)
        raw_result = await session.execute(query)
        existing_user_records = raw_result.all()

        assert existing_user_records[0] == ((user_id, mock_id))

    async def test_account_info_doesnt_exist(
        self,
        user: User,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        await truncate(AccountInfo.__tablename__)

        response = user_client.post(
            "gc/p/create_bank_account",
            json={
                "user_id": user_id,
                "customer_id": user_id,
                "iban": user_id,
            },
        )

        assert response.status_code == 403

    async def test_successful_existing_user(
        self,
        user: User,
        session,
        account_info_data_factory,
        payment_users_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(AccountInfo.__tablename__)
        await truncate(PaymentUsers.__tablename__)
        await account_info_data_factory(user_id=user.id)
        await payment_users_data_factory(
            user_id=user_id, p_customer_id=mock_id, iban="", p_bank_account_id=""
        )
        new_bank_account = namedtuple("new_bank_account", "id")

        with (
            mock.patch(
                "gocardless_pro.services.CustomerBankAccountsService.create",
                return_value=new_bank_account(mock_id),
            ),
        ):
            response = user_client.post(
                "gc/p/create_bank_account",
                json={
                    "user_id": user_id,
                    "customer_id": user_id,
                    "iban": user_id,
                },
            )

        assert response.status_code == 201
        assert response.json()["bank_account_id"] == mock_id

        query = select(
            PaymentUsers.iban,
            PaymentUsers.p_bank_account_id,
        ).where(PaymentUsers.user_id == user_id)
        raw_result = await session.execute(query)
        existing_user_records = raw_result.all()

        assert existing_user_records[0] == ((user_id, mock_id))

    async def test_validation_failed_error(
        self,
        user: User,
        account_info_data_factory,
        payment_users_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(AccountInfo.__tablename__)
        await truncate(PaymentUsers.__tablename__)
        await account_info_data_factory(user_id=user.id)

        with (
            mock.patch(
                "gocardless_pro.services.CustomerBankAccountsService.create",
                side_effect=ValidationFailedError(error={"message": "mock error"}),
            ),
        ):
            response = user_client.post(
                "gc/p/create_bank_account",
                json={
                    "user_id": user_id,
                    "customer_id": user_id,
                    "iban": user_id,
                },
            )

        assert response.status_code == 400

        await payment_users_data_factory(
            user_id=user_id, p_customer_id=mock_id, iban="", p_bank_account_id=""
        )

        with (
            mock.patch(
                "gocardless_pro.services.CustomerBankAccountsService.create",
                side_effect=ValidationFailedError(error={"message": "mock error"}),
            ),
        ):
            response = user_client.post(
                "gc/p/create_bank_account",
                json={
                    "user_id": user_id,
                    "customer_id": user_id,
                    "iban": user_id,
                },
            )

        assert response.status_code == 400

    async def test_bank_account_is_already_registered(
        self,
        user: User,
        account_info_data_factory,
        payment_users_data_factory,
        user_client: TestClient,
        truncate,
        mock_get_access_token,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(AccountInfo.__tablename__)
        await truncate(PaymentUsers.__tablename__)
        await account_info_data_factory(user_id=user.id)
        await payment_users_data_factory(
            user_id=user_id, p_customer_id=mock_id, iban=user_id, p_bank_account_id=""
        )

        response = user_client.post(
            "gc/p/create_bank_account",
            json={
                "user_id": user_id,
                "customer_id": user_id,
                "iban": user_id,
            },
        )

        assert response.status_code == 409
