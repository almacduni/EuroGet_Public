from unittest import mock

from fastapi.testclient import TestClient
from gotrue.errors import AuthApiError
from users.tables import User


class TestMe:
    async def test__ok_with_auth_header(
        self,
        user: User,
        user_client: TestClient,
    ):
        # Arrange:

        # Act:
        response = user_client.get("/auth/me")

        # Assert
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == str(user.id)

    async def test__ok_with_auth_cookie(
        self,
        user: User,
        user_client: TestClient,
    ):
        # Arrange: drop default auth, add cookies
        del user_client.headers["Authorization"]
        user_client.cookies["sb-access-token"] = "fake_token"

        # Act:
        response = user_client.get("/auth/me")

        # Assert
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == str(user.id)

    async def test__not_authorized(
        self,
        user_client: TestClient,
    ):
        # Arrange: drop default auth
        del user_client.headers["Authorization"]

        # Act:
        response = user_client.get("/auth/me")

        # Assert
        assert response.status_code == 401

    async def test__api_error(
        self,
        user_client: TestClient,
    ):
        # Arrange:

        # Act:
        with mock.patch(
            "gotrue.SyncGoTrueClient.get_user",
            side_effect=AuthApiError(message="Unknown", status=400),
        ):
            response = user_client.get("/auth/me")

        # Assert
        assert response.status_code == 401
