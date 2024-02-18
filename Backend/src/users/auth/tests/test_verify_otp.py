from unittest import mock

from fastapi.testclient import TestClient
from gotrue import AuthResponse


class TestVerifyOTP:
    async def test_verify__ok(
        self,
        client: TestClient,
    ):
        # Arrange:
        phone = "+351924010101"
        otp = "123456"

        # Act:
        with mock.patch(
            "gotrue.SyncGoTrueClient.verify_otp", return_value=AuthResponse()
        ) as verify_mock:
            response = client.post(
                "/auth/verify-otp",
                json={
                    "phone": phone,
                    "otp": otp,
                },
            )

        # Assert
        assert response.status_code == 200, response.json()
        verify_mock.assert_called_once_with(
            {
                "phone": phone,
                "token": otp,
                "type": "sms",
            }
        )
