import json
from unittest import mock

from fastapi.testclient import TestClient
from gocardless.search.services import InstitutionDto, InstitutionsDto


class TestGetInstitutions:
    async def test__ok_with_country(
        self,
        user_client: TestClient,
        mock_get_access_token,
    ):
        # Arrange: prepare mocks
        mock_data = {
            "institutions": [
                {
                    "id": "foobar",
                    "name": "mock name",
                    "logo_url": "mock logo url",
                }
            ]
        }

        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            return_value=mock_data,
        ) as mock_request:
            # Act: make a request
            response = user_client.post(
                "/gc/search/institutions",
                json={"id": "", "country": "GB"},
            )
            assert response.status_code == 201

            # Assert: 1. check calls to gocardless service
            mock_request.assert_awaited_once_with(
                method="GET",
                path="/api/v2/institutions/?country=GB",
                access_token=mock_get_access_token.token,
            )

        # 2. check response
        response_dto = InstitutionsDto(**response.json())
        assert response_dto.model_dump_json() == json.dumps(mock_data, separators=(",", ":"))

    async def test__ok_with_id(
        self,
        user_client: TestClient,
        mock_get_access_token,
    ):
        # Arrange: prepare mocks
        mock_data = {
            "id": "foobar",
            "name": "mock name",
            "logo_url": "mock logo url",
        }

        with mock.patch(
            "gocardless.client.GoCardlessHttpClient.request",
            return_value=mock_data,
        ) as mock_request:
            # Act: make a request
            response = user_client.post(
                "/gc/search/byid",
                json={"id": "1"},
            )
            assert response.status_code == 201

            # Assert: 1. check calls to gocardless service
            mock_request.assert_awaited_once_with(
                method="GET",
                path="/api/v2/institutions/1/",
                access_token=mock_get_access_token.token,
            )

        # 2. check response
        response_dto = InstitutionDto(**response.json())
        assert response_dto.model_dump_json() == json.dumps(mock_data, separators=(",", ":"))
