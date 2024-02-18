import uuid
from unittest import mock

import pytest
from common.cached_tokens_service import BaseApiError
from common.date_utils import time_now
from gocardless.bank_connect.services import RequisitionDto
from gocardless.constants import DEFAULT_USER_LANGUAGE, BankConnectionStatus
from gocardless.tables import BankConnections, BankIBAN
from loans.tables import OpenBankingDataset
from settings import Settings
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestProcessStageCreateAgreementAndLink:
    async def test__create_agreement_and_link__ok(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        service,
        mock_get_access_token,
    ):
        settings = Settings()
        bank_connection = await bank_connection_factory(user_id=user.id)
        agreement_id = str(uuid.uuid4())
        requisition_id = str(uuid.uuid4())
        link = "https://fake-link-for-auth.com/"

        # Mock the API client to return a successful responses
        # Mock _fetch_requisition to stop after 1 and 2 stages
        with mock.patch.object(
            service,
            "_fetch_requisition",
            return_value=RequisitionDto(
                id="",
                status=BankConnectionStatus.CREATED,
            ),
        ), mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            side_effect=[
                {"id": agreement_id, "max_historical_days": 360, "access_valid_for_days": 180},
                {
                    "id": requisition_id,
                    "link": link,
                },
            ],
        ) as mock_request:
            # Act
            await service.process_bank_connection(bank_connection.id)

            # Assert: 1. check calls to gocardless service
            mock_request.assert_has_calls(
                [
                    mock.call(
                        method="POST",
                        path="/api/v2/agreements/enduser/",
                        data={
                            "institution_id": bank_connection.institution_id,
                            "max_historical_days": 360,
                            "access_valid_for_days": 180,
                            "access_scope": ["balances", "details", "transactions"],
                        },
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="POST",
                        path="/api/v2/requisitions/",
                        data={
                            "redirect": settings.gocardless.redirect_url,
                            "institution_id": bank_connection.institution_id,
                            "reference": bank_connection.id,
                            "agreement": agreement_id,
                            "user_language": DEFAULT_USER_LANGUAGE,
                        },
                        access_token=mock_get_access_token.token,
                    ),
                ]
            )

        # Verify the result is a BankConnectAgreementDto with the expected agreement ID
        # assert result.agreement_id == agreement_id
        #
        db_result = await session.execute(
            select(
                BankConnections.agreement_id,
                BankConnections.requisition_id,
                BankConnections.link,
                BankConnections.status,
            ).where(
                BankConnections.id == bank_connection.id,
            )
        )
        assert db_result.one() == (
            agreement_id,
            requisition_id,
            link,
            BankConnectionStatus.CREATED,
        )

    async def test__create_agreement__retry(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        service,
        mock_get_access_token,
    ):
        settings = Settings()
        bank_connection = await bank_connection_factory(user_id=user.id)
        agreement_id = str(uuid.uuid4())
        requisition_id = str(uuid.uuid4())
        link = "https://fake-link-for-auth.com/"

        # Mock the API client to return a successful responses
        # Mock _fetch_requisition to stop after 1 and 2 stages
        with mock.patch.object(
            service,
            "_fetch_requisition",
            return_value=RequisitionDto(
                id="",
                status=BankConnectionStatus.CREATED,
            ),
        ), mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            side_effect=[
                BaseApiError(
                    data={
                        "id": agreement_id,
                        "max_historical_days": 360,
                        "transaction_total_days": 180,
                    },
                    status=400,
                ),
                {"id": agreement_id, "max_historical_days": 360, "access_valid_for_days": 180},
                {
                    "id": requisition_id,
                    "link": link,
                },
            ],
        ) as mock_request:
            # Act
            await service.process_bank_connection(bank_connection.id)

            # Assert: 1. check calls to gocardless service
            mock_request.assert_has_calls(
                [
                    mock.call(
                        method="POST",
                        path="/api/v2/agreements/enduser/",
                        data={
                            "institution_id": bank_connection.institution_id,
                            "max_historical_days": 360,
                            "access_valid_for_days": 180,
                            "access_scope": ["balances", "details", "transactions"],
                        },
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="POST",
                        path="/api/v2/agreements/enduser/",
                        data={
                            "institution_id": bank_connection.institution_id,
                            "max_historical_days": 180,
                            "access_valid_for_days": 180,
                            "access_scope": ["balances", "details", "transactions"],
                        },
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="POST",
                        path="/api/v2/requisitions/",
                        data={
                            "redirect": settings.gocardless.redirect_url,
                            "institution_id": bank_connection.institution_id,
                            "reference": bank_connection.id,
                            "agreement": agreement_id,
                            "user_language": DEFAULT_USER_LANGUAGE,
                        },
                        access_token=mock_get_access_token.token,
                    ),
                ]
            )

        # Verify the result is a BankConnectAgreementDto with the expected agreement ID
        # assert result.agreement_id == agreement_id
        #
        db_result = await session.execute(
            select(
                BankConnections.agreement_id,
                BankConnections.requisition_id,
                BankConnections.link,
                BankConnections.status,
            ).where(
                BankConnections.id == bank_connection.id,
            )
        )
        assert db_result.one() == (
            agreement_id,
            requisition_id,
            link,
            BankConnectionStatus.CREATED,
        )


class TestFetchRequisition:
    @pytest.mark.parametrize(
        "target_status", (BankConnectionStatus.SELECTING_ACCOUNTS, BankConnectionStatus.REJECTED)
    )
    async def test__fetch_requisition__not_success_status(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        service,
        mock_get_access_token,
        target_status,
    ):
        bank_connection = await bank_connection_factory(
            user_id=user.id,
            agreement_id=str(uuid.uuid4()),
            agreement_accepted_at=time_now(),
            requisition_id=str(uuid.uuid4()),
            link="https://fake-link-for-auth.com/",
            status=BankConnectionStatus.CREATED,
        )

        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            side_effect=[
                {"id": bank_connection.requisition_id, "status": target_status, "bank_accounts": []}
            ],
        ) as mock_request:
            # Act
            await service.process_bank_connection(bank_connection.id)

            # Assert: 1. check calls to gocardless service
            mock_request.assert_has_calls(
                [
                    mock.call(
                        method="GET",
                        path=f"/api/v2/requisitions/{bank_connection.requisition_id}/",
                        access_token=mock_get_access_token.token,
                    ),
                ]
            )

        db_result = await session.execute(
            select(
                BankConnections.status,
            ).where(
                BankConnections.id == bank_connection.id,
            )
        )
        assert db_result.one()[0] == target_status


class TestFetchAccountsDetails:
    async def test__fetch_accounts__ok(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        service,
        mock_get_access_token,
    ):
        bank_connection = await bank_connection_factory(
            user_id=user.id,
            agreement_id=str(uuid.uuid4()),
            agreement_accepted_at=time_now(),
            requisition_id=str(uuid.uuid4()),
            link="https://fake-link-for-auth.com/",
            status=BankConnectionStatus.LINKED,
        )

        account1_id = str(uuid.uuid4())
        account2_id = str(uuid.uuid4())
        iban1 = "123"
        iban2 = "321"
        owner_name = "John Doe"
        bank_name = "Bank Name"
        bank_logo = "https://fake-link-to-bank-logo.com/"

        with mock.patch.object(
            service,
            "_fetch_requisition",
            return_value=RequisitionDto(
                id="",
                status=BankConnectionStatus.LINKED,
                bank_accounts=[account1_id, account2_id],
            ),
        ), mock.patch.object(
            service,
            "_fetch_account_balances",
        ), mock.patch.object(service, "_fetch_account_transactions"), mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            side_effect=[
                {
                    "id": account1_id,
                    "iban": iban1,
                    "owner_name": owner_name,
                    "created": time_now().isoformat(),
                    "institution_id": bank_connection.institution_id,
                },
                {
                    "id": account2_id,
                    "iban": iban2,
                    "owner_name": owner_name,
                    "created": time_now().isoformat(),
                    "institution_id": bank_connection.institution_id,
                },
                {
                    "id": bank_connection.institution_id,
                    "name": bank_name,
                    "logo": bank_logo,
                },
            ],
        ) as mock_request:
            # Act
            await service.process_bank_connection(bank_connection.id)

            # Assert: 1. check calls to gocardless service
            mock_request.assert_has_calls(
                [
                    mock.call(
                        method="GET",
                        path=f"/api/v2/accounts/{account1_id}",
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="GET",
                        path=f"/api/v2/accounts/{account2_id}",
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="GET",
                        path=f"/api/v2/institutions/{bank_connection.institution_id}",
                        access_token=mock_get_access_token.token,
                    ),
                ]
            )

        db_result = await session.execute(
            select(
                BankIBAN.id,
                BankIBAN.iban,
                BankIBAN.owner_name,
                BankIBAN.bank_name,
                BankIBAN.bank_logo,
            ).where(
                BankIBAN.bank_connection_id == bank_connection.id,
            )
        )
        accounts = db_result.all()
        assert accounts[0] == (
            uuid.UUID(account1_id),
            iban1,
            owner_name,
            bank_name,
            bank_logo,
        )

        assert accounts[1] == (
            uuid.UUID(account2_id),
            iban2,
            owner_name,
            bank_name,
            bank_logo,
        )


class TestFetchBalances:
    async def test__fetch_balances__ok(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        bank_iban_factory,
        service,
        mock_get_access_token,
    ):
        bank_connection = await bank_connection_factory(
            user_id=user.id,
            agreement_id=str(uuid.uuid4()),
            agreement_accepted_at=time_now(),
            requisition_id=str(uuid.uuid4()),
            link="https://fake-link-for-auth.com/",
            status=BankConnectionStatus.LINKED,
        )
        account1 = await bank_iban_factory(bank_connection=bank_connection)
        account2 = await bank_iban_factory(bank_connection=bank_connection)

        amount1 = 100
        amount2 = 200

        with mock.patch.object(
            service,
            "_fetch_requisition",
            return_value=RequisitionDto(
                id="",
                status=BankConnectionStatus.LINKED,
                bank_accounts=[account1.id, account2.id],
            ),
        ), mock.patch.object(
            service,
            "_fetch_accounts_details",
        ), mock.patch.object(service, "_fetch_account_transactions"), mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            side_effect=[
                {
                    "balances": [{"balanceAmount": {"amount": amount1}}],
                },
                {
                    "balances": [{"balanceAmount": {"amount": amount2}}],
                },
            ],
        ) as mock_request:
            # Act
            await service.process_bank_connection(bank_connection.id)

            # Assert: 1. check calls to gocardless service
            mock_request.assert_has_calls(
                [
                    mock.call(
                        method="GET",
                        path=f"/api/v2/accounts/{account1.id}/balances/",
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="GET",
                        path=f"/api/v2/accounts/{account2.id}/balances/",
                        access_token=mock_get_access_token.token,
                    ),
                ]
            )

        db_result = await session.execute(
            select(
                BankIBAN.balance,
            ).where(
                BankIBAN.bank_connection_id == bank_connection.id,
            )
        )
        accounts = db_result.all()
        assert accounts[0] == (amount1,)

        assert accounts[1] == (amount2,)


class TestFetchTransactions:
    async def test__fetch_transactions__ok(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        bank_iban_factory,
        service,
        mock_get_access_token,
    ):
        bank_connection = await bank_connection_factory(
            user_id=user.id,
            agreement_id=str(uuid.uuid4()),
            agreement_accepted_at=time_now(),
            requisition_id=str(uuid.uuid4()),
            link="https://fake-link-for-auth.com/",
            status=BankConnectionStatus.LINKED,
        )
        account1 = await bank_iban_factory(bank_connection=bank_connection)
        account2 = await bank_iban_factory(bank_connection=bank_connection)

        with mock.patch.object(
            service,
            "_fetch_requisition",
            return_value=RequisitionDto(
                id="",
                status=BankConnectionStatus.LINKED,
                bank_accounts=[account1.id, account2.id],
            ),
        ), mock.patch.object(
            service,
            "_fetch_accounts_details",
        ), mock.patch.object(service, "_fetch_account_balances"), mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            side_effect=[
                {
                    "transactions": [{"foo": "bar"}],
                },
                {
                    "transactions": [{"bar": "foo"}],
                },
            ],
        ) as mock_request:
            # Act
            await service.process_bank_connection(bank_connection.id)

            # Assert: 1. check calls to gocardless service
            mock_request.assert_has_calls(
                [
                    mock.call(
                        method="GET",
                        path=f"/api/v2/accounts/{account1.id}/transactions/",
                        access_token=mock_get_access_token.token,
                    ),
                    mock.call(
                        method="GET",
                        path=f"/api/v2/accounts/{account2.id}/transactions/",
                        access_token=mock_get_access_token.token,
                    ),
                ]
            )

        db_result = await session.execute(
            select(
                OpenBankingDataset.raw_transactions,
                OpenBankingDataset.gc_account_id,
            ).where(
                OpenBankingDataset.user_id == user.id,
            )
        )
        accounts = db_result.all()
        assert accounts[0] == (
            {
                "transactions": [{"foo": "bar"}],
            },
            account1.id,
        )

        assert accounts[1] == (
            {
                "transactions": [{"bar": "foo"}],
            },
            account2.id,
        )
