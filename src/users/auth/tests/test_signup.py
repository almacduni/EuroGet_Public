from unittest import mock

from fastapi.testclient import TestClient
from gotrue.errors import AuthApiError


class TestSignup:
    async def test_email__ok(
        self,
        client: TestClient,
    ):
        # Arrange:
        email = "random@fakemail.com"

        # Act:
        with mock.patch("gotrue.SyncGoTrueClient.sign_in_with_otp") as sign_in_mock:
            response = client.post("/auth/signup", json={"email": email})

        # Assert
        assert response.status_code == 200, response.json()
        sign_in_mock.assert_called_once_with(
            {
                "email": email,
                "options": {
                    "email_redirect_to": "euroget://euroget.co/step3Banner",
                },
            }
        )

    async def test_phone__ok(
        self,
        client: TestClient,
    ):
        # Arrange:
        phone = "+351924010101"

        # Act:
        with mock.patch("gotrue.SyncGoTrueClient.sign_in_with_otp") as sign_in_mock:
            response = client.post("/auth/signup", json={"phone": phone})

        # Assert
        assert response.status_code == 200, response.json()
        sign_in_mock.assert_called_once_with(
            {
                "phone": phone,
                "options": {
                    "email_redirect_to": "euroget://euroget.co/step3Banner",
                },
            }
        )

    async def test_no_data__error(
        self,
        client: TestClient,
    ):
        # Arrange:

        # Act:
        response = client.post("/auth/signup", json={})

        # Assert
        assert response.status_code == 422, response.json()

    async def test_both_keys__error(
        self,
        client: TestClient,
    ):
        # Arrange:

        # Act:
        response = client.post(
            "/auth/signup",
            json={
                "phone": "+351924010101",
                "email": "fake@fakemail.com",
            },
        )

        # Assert
        assert response.status_code == 422, response.json()

    async def test__api_error(
        self,
        client: TestClient,
    ):
        # Arrange:
        email = "random@fakemail.com"

        # Act:
        with mock.patch(
            "gotrue.SyncGoTrueClient.sign_in_with_otp",
            side_effect=AuthApiError(message="Unknown", status=502),
        ):
            response = client.post("/auth/signup", json={"email": email})

        # Assert
        assert response.status_code == 502
