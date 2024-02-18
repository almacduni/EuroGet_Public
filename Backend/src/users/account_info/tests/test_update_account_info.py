from fastapi.testclient import TestClient
from polyfactory.factories.pydantic_factory import ModelFactory
from users.account_info.services import AccountInfoDto


class AccountInfoDtoFactory(ModelFactory):
    __allow_none_optionals__ = False
    __model__ = AccountInfoDto


class TestUpdateAccountInfo:
    async def test_full_update__ok(
        self,
        user_client: TestClient,
    ):
        # Arrange: prepare request
        account_info_request = AccountInfoDtoFactory.build()
        data = account_info_request.model_dump()
        data["birth_date"] = data["birth_date"].isoformat()

        # Act: make request
        response = user_client.put("/account/update-info", json=data)

        # Assert: check that fields were updated
        assert response.status_code == 200, response.json()
        assert response.json() == account_info_request.model_dump(mode="json")

    async def test_partial_update__ok(
        self,
        user_client: TestClient,
    ):
        # Arrange

        # Act: make request
        response = user_client.put("/account/update-info", json={"email": "new@email.com"})

        # Assert: check that fields were updated
        assert response.status_code == 200, response.json()
        assert response.json()["email"] == "new@email.com"
