from fastapi.testclient import TestClient
from gocardless.constants import BankConnectionStatus
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestGetBankAccountBalances:
    async def test__get__ok(
        self,
        session: AsyncSession,
        user: User,
        user_client: TestClient,
        bank_connection_factory,
        bank_iban_factory,
    ):
        bank_connection = await bank_connection_factory(
            user_id=user.id,
            status=BankConnectionStatus.LINKED,
        )
        iban1 = await bank_iban_factory(bank_connection_id=bank_connection.id, balance=100)
        iban2 = await bank_iban_factory(bank_connection_id=bank_connection.id, balance=800)

        response = user_client.get("/gc/ob/get-bank-accounts-balances")

        assert response.status_code == 200

        data = response.json()
        assert data == {
            "data": [
                {
                    "balance_amount": 100.0,
                    "bank_logo": iban1.bank_logo,
                    "bank_name": iban1.bank_name,
                    "iban": iban1.iban,
                    "institution_id": bank_connection.institution_id,
                },
                {
                    "balance_amount": 800.0,
                    "bank_logo": iban2.bank_logo,
                    "bank_name": iban2.bank_name,
                    "iban": iban2.iban,
                    "institution_id": bank_connection.institution_id,
                },
            ],
            "low": True,
        }
