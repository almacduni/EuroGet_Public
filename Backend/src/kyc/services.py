import json
from datetime import datetime
from typing import Optional

from common.services import Service
from kyc.client import SumSubClient
from kyc.tables import KYCData
from pydantic import BaseModel, EmailStr
from sqlalchemy import select, update
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.exc import NoResultFound
from sqlalchemy.ext.asyncio import AsyncSession


class LevelNameRequest(BaseModel):
    # TODO: enum?
    level_name: str


class ApplicantIdDto(BaseModel):
    applicant_id: str


class SumSubAPIError(Exception):
    def __init__(self, details: dict, status: int):
        self.details = details
        self.status = status


class NoApplicationId(Exception):
    pass


# TODO: may be save level name?
class CreateLinkRequest(LevelNameRequest):
    # TODO: validate locale name
    locale: str = "en"


class KYCLinkDto(BaseModel):
    kyc_link: str


class ApplicantDataDto(BaseModel):
    id: str
    created_at: Optional[datetime]
    user_id: str
    email: Optional[EmailStr]
    first_name: Optional[str]
    last_name: Optional[str]
    birth_date: Optional[datetime]
    tax_id: Optional[str]
    country_code: Optional[str]
    address: Optional[str]
    city: Optional[str]
    zip_code: Optional[str]
    country: Optional[str]


class RejectionReason(BaseModel):
    reason: str
    description: str
    labels: list[str]


class RejectionDto(BaseModel):
    reasons: list[RejectionReason]


class WebhookData(BaseModel):
    pass


class WebhookSignatureVerificationFailed(Exception):
    pass


class KYCService(Service):
    def __init__(self, session: AsyncSession):
        super().__init__(session)
        self.api_client = SumSubClient()

    async def create_applicant(self, user_id: str, request: LevelNameRequest) -> ApplicantIdDto:
        status, response_data = await self.api_client.signed_request(
            "POST",
            path=f"/resources/applicants?levelName={request.level_name}",
            data={"externalUserId": user_id},
        )

        if status not in [200, 201]:
            raise SumSubAPIError(details=response_data, status=status)

        applicant_id = response_data["id"]
        async with self.session.begin():
            await self.session.execute(
                insert(KYCData)
                .values(sumsub_id=applicant_id, user_id=user_id)
                .on_conflict_do_update(
                    index_elements=[KYCData.user_id],
                    set_=dict(sumsub_id=applicant_id),
                )
            )
        return ApplicantIdDto(applicant_id=applicant_id)

    async def create_kyc_link(self, user_id: str, request: CreateLinkRequest) -> KYCLinkDto:
        status, response_data = await self.api_client.signed_request(
            "POST",
            path=f"/resources/sdkIntegrations/levels/{request.level_name}/websdkLink",
            data={
                "ttlInSecs": self.settings.sumsub.ttl_in_secs,
                "externalUserId": user_id,
                "lang": request.locale,
            },
        )
        if status != 200:
            raise SumSubAPIError(details=response_data, status=status)

        kyc_link = response_data["url"]
        async with self.session.begin():
            await self.session.execute(
                update(KYCData)
                .values(
                    link=kyc_link,
                )
                .where(
                    KYCData.user_id == user_id,
                )
            )

        return KYCLinkDto(kyc_link=kyc_link)

    async def get_applicant_data(self, user_id: str) -> ApplicantDataDto:
        # Fetch the user's applicant id
        query = select(
            KYCData.sumsub_id,
        ).where(KYCData.user_id == user_id)
        try:
            raw_result = await self.session.execute(query)
            applicant_id = raw_result.one()[0]
        except NoResultFound:
            raise NoApplicationId()

        status, response_data = await self.api_client.signed_request(
            "GET",
            # Construct the URL based on the provided ID
            path=f"/resources/applicants/{applicant_id}/one",
        )
        if status != 200:
            raise SumSubAPIError(details=response_data, status=status)

        # Parse the response data
        info = response_data.get("info") or {}
        # Assuming the first document contains the necessary information
        id_docs = info.get("idDocs", [{}])[0]
        # Assuming the address is the first in the list
        address = info.get("addresses", [{}])[0]

        # Extract the specific fields
        return ApplicantDataDto(
            id=response_data.get("id"),
            created_at=response_data.get("createdAt"),
            user_id=response_data.get("externalUserId"),
            email=response_data.get("email"),
            first_name=id_docs.get("firstName"),
            last_name=id_docs.get("lastName"),
            birth_date=id_docs.get("dob"),
            tax_id=id_docs.get("tin"),
            country_code=id_docs.get("country"),
            address=address.get("street"),
            city=address.get("town"),
            zip_code=address.get("postCode"),
            country=address.get("country"),
        )

    async def reset_applicant(self, user_id: str):
        # Fetch the user's applicant id
        query = select(
            KYCData.sumsub_id,
        ).where(KYCData.user_id == user_id)
        try:
            raw_result = await self.session.execute(query)
            applicant_id = raw_result.one()[0]
        except NoResultFound:
            raise NoApplicationId()

        status, response_data = await self.api_client.signed_request(
            "POST", path=f"/resources/applicants/{applicant_id}/reset"
        )
        if status != 200:
            raise SumSubAPIError(details=response_data, status=status)

    async def clarify_rejection(self, user_id: str) -> RejectionDto:
        # Fetch the user's applicant id
        query = select(
            KYCData.sumsub_id,
        ).where(KYCData.user_id == user_id)
        try:
            raw_result = await self.session.execute(query)
            applicant_id = raw_result.one()[0]
        except NoResultFound:
            raise NoApplicationId()

        status, response_data = await self.api_client.signed_request(
            "POST", path=f"/resources/applicants/{applicant_id}/clarification"
        )
        if status != 200:
            raise SumSubAPIError(details=response_data, status=status)

        reject_reasons = response_data.get("rejectLabels", [])
        structured_reasons = []
        for reason in reject_reasons:
            structured_reasons.append(
                RejectionReason(
                    reason=reason["rejectReason"],
                    description=reason["rejectReasonDescription"],
                    labels=reason["rejectLabels"],
                )
            )
        return RejectionDto(reasons=structured_reasons)

    async def accept_webhooks(self, signature: str, raw_request: bytes):
        if not self.api_client.verify_signature(
            signature=signature,
            request_body=raw_request,
        ):
            raise WebhookSignatureVerificationFailed()

        # Parse the incoming JSON data
        webhook_data = json.loads(raw_request)

        # Extract necessary information
        sumsub_id = webhook_data.get("applicantId")
        review_answer = webhook_data.get("reviewResult", {}).get("reviewAnswer")
        reject_labels = webhook_data.get("reviewResult", {}).get("rejectLabels", [])
        webhook_type = webhook_data.get("type")  # Extract the webhook type

        # Prepare the data to update based on the results
        data_to_update = {
            "review_answer": review_answer,
            "status": webhook_type,
        }  # Update the status with the webhook type

        if review_answer == "RED":
            # If the verification failed, we might have reject labels to save
            data_to_update["reject_labels"] = reject_labels

        async with self.session.begin():
            await self.session.execute(
                update(KYCData).values(**data_to_update).where(KYCData.sumsub_id == sumsub_id)
            )
