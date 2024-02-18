from unittest import mock

from fastapi.testclient import TestClient
from kyc.tables import KYCData
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession


class TestAcceptWebhooks:
    async def test__ok(
        self,
        session: AsyncSession,
        client: TestClient,
        user_factory,
        kyc_data_factory,
    ):
        # Arrange: prepare user and API mocks
        user = await user_factory()
        applicant_id = "fake_id"
        await kyc_data_factory(user_id=user.id, sumsub_id=applicant_id)

        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().verify_signature = mock.MagicMock(return_value=True)

            # Act: make a request
            response = client.post(
                "/kyc/accept_webhooks",
                headers={"x-sumsub-signature": "mock_signature"},
                json={
                    "applicantId": applicant_id,
                    "type": "applicantReviewed",
                    "reviewResult": {
                        "reviewAnswer": "RED",
                        "rejectLabels": ["UNSATISFACTORY_PHOTOS"],
                    },
                },
            )

        # Assert: check response
        assert response.status_code == 200
        response_data = response.json()
        assert response_data["status"] == "success"

        # check db
        result = await session.execute(
            select(
                KYCData.status,
                KYCData.review_answer,
                KYCData.reject_labels,
            ).where(KYCData.sumsub_id == applicant_id)
        )
        data = result.one()
        assert data.status == "applicantReviewed"
        assert data.review_answer == "RED"
        assert data.reject_labels == ["UNSATISFACTORY_PHOTOS"]

    async def test__signature_error(self, client: TestClient):
        # Arrange: prepare API mocks
        with mock.patch("kyc.services.SumSubClient") as sumsub_mock:
            sumsub_mock().verify_signature = mock.MagicMock(return_value=False)

            # Act: make a request
            response = client.post(
                "/kyc/accept_webhooks", headers={"x-sumsub-signature": "mock_signature"}, json={}
            )

        # Assert: check response
        assert response.status_code == 400
