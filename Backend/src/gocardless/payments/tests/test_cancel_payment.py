from collections import namedtuple
from unittest import mock

from fastapi.testclient import TestClient


class TestCancelPayment:
    async def test_successful(
        self, user_client: TestClient, payments_service, mock_get_access_token
    ):
        mock_data = {"id": "207f9981-d96c-4aa8-861a-683a1894f42e", "status": "STATUS"}
        payment_response = namedtuple("payment_response", "id status")

        with (
            mock.patch(
                "gocardless_pro.services.PaymentsService.cancel",
                return_value=payment_response(mock_data["id"], mock_data["status"]),
            ),
        ):
            response = user_client.post(
                "gc/p/cancel_payment",
                json={
                    "payment_id": mock_data["id"],
                },
            )

            status = await payments_service.cancel_payment(mock_data["id"])

        assert response.status_code == 200
        assert response.json()["status"] == "success"
        assert status == mock_data["status"]

    async def test_fail(self, user_client: TestClient, mock_get_access_token):
        mock_data = {
            "id": "207f9981-d96c-4aa8-861a-683a1894f42e",
        }

        with (
            mock.patch(
                "gocardless_pro.services.PaymentsService.cancel",
                side_effect=Exception("Error"),
            ),
        ):
            response = user_client.post(
                "gc/p/cancel_payment",
                json={
                    "payment_id": mock_data["id"],
                },
            )

        assert response.status_code == 400
