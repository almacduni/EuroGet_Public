from datetime import datetime

from fastapi.testclient import TestClient
from loans.tables import IssuedLoans
from users.tables import User


class TestCalculatePaydayLoanPaydayLoanPayment:
    async def test_successful(
        self,
        user: User,
        issued_loans_data_factory,
        user_client: TestClient,
    ):
        user_id = str(user.id)
        mock_data = {
            "id": "207f9981-d96c-4aa8-861a-683a1894f42e",
            "amount": 100,
            "status": "STATUS",
            "charge_date": datetime.now(),
        }
        await issued_loans_data_factory(
            loan_id=mock_data["id"],
            user_id=user_id,
            payment_id=mock_data["id"],
            total_sum=mock_data["amount"],
        )

        response = user_client.post(
            "gc/p/calculate_payday_loan_payment",
            json={
                "user_id": user_id,
                "payment_id": mock_data["id"],
            },
        )

        assert response.status_code == 200
        assert response.json()["amount"] == mock_data["amount"]
        assert response.json()["payment_id"] == mock_data["id"]

    async def test_fail_no_loans(self, user: User, user_client: TestClient, truncate):
        user_id = str(user.id)
        mock_data = {
            "id": "207f9981-d96c-4aa8-861a-683a1894f42e",
        }
        await truncate(IssuedLoans.__tablename__)

        response = user_client.post(
            "gc/p/calculate_payday_loan_payment",
            json={
                "user_id": user_id,
                "payment_id": mock_data["id"],
            },
        )

        assert response.status_code == 400

    async def test_fail_zero_total_amount(
        self,
        user: User,
        issued_loans_data_factory,
        user_client: TestClient,
        truncate,
    ):
        user_id = str(user.id)
        mock_data = {
            "id": "207f9981-d96c-4aa8-861a-683a1894f42e",
            "amount": 100,
            "status": "STATUS",
            "charge_date": datetime.now(),
        }
        await truncate(IssuedLoans.__tablename__)
        await issued_loans_data_factory(
            loan_id=mock_data["id"], user_id=user_id, payment_id=mock_data["id"], total_sum=0
        )

        response = user_client.post(
            "gc/p/calculate_payday_loan_payment",
            json={
                "user_id": user_id,
                "payment_id": mock_data["id"],
            },
        )

        assert response.status_code == 400
