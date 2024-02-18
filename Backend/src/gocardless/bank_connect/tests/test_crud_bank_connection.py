from fastapi.testclient import TestClient
from gocardless.constants import BankConnectionStatus
from gocardless.tables import BankConnections
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.sql.functions import count
from users.tables import User


class TestCrudBankConnection:
    async def test__start__ok(
        self,
        session: AsyncSession,
        user_client: TestClient,
    ):
        institution_id = "fake_institution_id"

        response = user_client.post(
            "/gc/ob/start-connection", json={"institution_id": institution_id}
        )

        assert response.status_code == 201

        data = response.json()
        assert data["status"] == BankConnectionStatus.PENDING
        result = await session.execute(select(count()).where(BankConnections.id == data["id"]))
        assert result.scalar() == 1

    async def test__get__ok(
        self,
        session: AsyncSession,
        user: User,
        user_client: TestClient,
        bank_connection_factory,
    ):
        bank_connection = await bank_connection_factory(user_id=user.id)

        response = user_client.get("/gc/ob/get-status")

        assert response.status_code == 200

        data = response.json()
        assert data["id"] == bank_connection.id
        assert data["status"] == bank_connection.status

    async def test__get__not_found(
        self,
        session: AsyncSession,
        user_client: TestClient,
    ):
        response = user_client.get("/gc/ob/get-status")

        assert response.status_code == 404

    async def test__reprocess__ok(
        self,
        session: AsyncSession,
        user: User,
        user_client: TestClient,
        bank_connection_factory,
    ):
        bank_connection = await bank_connection_factory(
            user_id=user.id, status=BankConnectionStatus.EXPIRED
        )

        response = user_client.post("/gc/ob/reprocess")

        assert response.status_code == 200

        data = response.json()
        assert data["id"] == bank_connection.id
        assert data["status"] == BankConnectionStatus.PENDING

    async def test__reprocess__not_found(
        self,
        session: AsyncSession,
        user_client: TestClient,
    ):
        response = user_client.post("/gc/ob/reprocess")

        assert response.status_code == 404
