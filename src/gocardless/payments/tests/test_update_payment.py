from collections import namedtuple
from unittest import mock

from fastapi.testclient import TestClient


class TestUpdatePayment:
    async def test_successful(
        self,
        user_client: TestClient,
        mock_get_access_token,
    ):
        mock_data = {"id": "207f9981-d96c-4aa8-861a-683a1894f42e", "attributes": {"foo": "bar"}}
        payment_response = namedtuple("payment_response", "id attributes")

        with (
            mock.patch(
                "gocardless_pro.services.PaymentsService.update",
                return_value=payment_response(mock_data["id"], mock_data["attributes"]),
            ),
        ):
            response = user_client.put(
                "gc/p/update_payment",
                json={
                    "payment_id": mock_data["id"],
                    "data": {"foo": "bar"},
                },
            )

        assert response.status_code == 201
        assert response.json()["attributes"] == {"foo": "bar"}

    async def test_fail(
        self,
        user_client: TestClient,
        mock_get_access_token,
    ):
        mock_data = {
            "id": "207f9981-d96c-4aa8-861a-683a1894f42e",
        }

        with (
            mock.patch(
                "gocardless_pro.services.PaymentsService.update",
                side_effect=Exception("Error"),
            ),
        ):
            response = user_client.put(
                "gc/p/update_payment",
                json={
                    "payment_id": mock_data["id"],
                    "data": {"foo": "bar"},
                },
            )

        assert response.status_code == 400
