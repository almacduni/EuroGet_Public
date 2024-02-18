from collections import namedtuple
from datetime import datetime
from unittest import mock

from fastapi.testclient import TestClient


class TestProcessPaydayLoanPayment:
    async def test_successful(
        self,
        user_client: TestClient,
        mock_get_access_token,
    ):
        mock_data = {
            "amount": 1,
            "mandate_id": "207f9981-d96c-4aa8-861a-683a1894f42e",
            "charge_date": str(datetime.now()),
            "id": "207f9981-d96c-4aa8-861a-683a1894f42e",
            "status": "STATUS",
        }
        payment_response = namedtuple("payment_response", "id status")

        with (
            mock.patch(
                "gocardless_pro.services.PaymentsService.create",
                return_value=payment_response(mock_data["id"], mock_data["status"]),
            ),
        ):
            response = user_client.post(
                "gc/p/payday_loan_payment",
                json={
                    "amount": mock_data["amount"],
                    "mandate_id": mock_data["mandate_id"],
                    "charge_date": mock_data["charge_date"],
                },
            )

        assert response.status_code == 201
        assert response.json()["id"] == mock_data["id"]
        assert response.json()["status"] == mock_data["status"]

    async def test_fail(
        self,
        user_client: TestClient,
        mock_get_access_token,
    ):
        mock_data = {
            "amount": 1,
            "mandate_id": "207f9981-d96c-4aa8-861a-683a1894f42e",
            "charge_date": str(datetime.now()),
        }

        with (
            mock.patch(
                "gocardless_pro.services.PaymentsService.create",
                side_effect=Exception("Error"),
            ),
        ):
            response = user_client.post(
                "gc/p/payday_loan_payment",
                json={
                    "amount": mock_data["amount"],
                    "mandate_id": mock_data["mandate_id"],
                    "charge_date": mock_data["charge_date"],
                },
            )

        assert response.status_code == 400
