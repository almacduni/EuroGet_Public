from typing import Annotated

from common.http_utils import DBSession, GetUser
from common.schemas import BasicStatusResponse
from fastapi import APIRouter, Depends, Header, HTTPException, Request, status
from kyc.services import (
    ApplicantDataDto,
    ApplicantIdDto,
    CreateLinkRequest,
    KYCLinkDto,
    KYCService,
    LevelNameRequest,
    NoApplicationId,
    RejectionDto,
    SumSubAPIError,
    WebhookSignatureVerificationFailed,
)

router = APIRouter()


def create_service(
    session: DBSession,
) -> KYCService:
    return KYCService(session)


GetService = Annotated[KYCService, Depends(create_service)]


@router.post(
    "/create_applicant",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "SumSub API returned an error"},
    },
)
async def create_applicant(
    service: GetService,
    request: LevelNameRequest,
    user: GetUser,
) -> ApplicantIdDto:
    try:
        return await service.create_applicant(user_id=user.id, request=request)
    except SumSubAPIError as e:
        raise HTTPException(status_code=e.status, detail=e.details)


@router.post(
    "/create_kyc_link",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "SumSub API returned an error"},
    },
)
async def create_kyc_link(
    service: GetService,
    request: CreateLinkRequest,
    user: GetUser,
) -> KYCLinkDto:
    try:
        return await service.create_kyc_link(user_id=user.id, request=request)
    except SumSubAPIError as e:
        raise HTTPException(status_code=e.status, detail=e.details)


@router.get(
    "/get_applicant_data",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "SumSub API returned an error"},
        403: {"description": "You don't have applicant_id yet"},
    },
)
async def get_applicant_data(
    service: GetService,
    user: GetUser,
) -> ApplicantDataDto:
    try:
        return await service.get_applicant_data(user_id=user.id)
    except SumSubAPIError as e:
        raise HTTPException(status_code=e.status, detail=e.details)
    except NoApplicationId:
        raise HTTPException(status_code=403)


@router.post(
    "/reset_applicant",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "SumSub API returned an error"},
        403: {"description": "You don't have applicant_id yet"},
    },
)
async def reset_applicant(
    service: GetService,
    user: GetUser,
) -> BasicStatusResponse:
    try:
        await service.reset_applicant(user_id=user.id)
    except SumSubAPIError as e:
        raise HTTPException(status_code=e.status, detail=e.details)
    except NoApplicationId:
        raise HTTPException(status_code=403)

    return BasicStatusResponse()


@router.post(
    "/clarify_rejection",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "SumSub API returned an error"},
        403: {"description": "You don't have applicant_id yet"},
    },
)
async def clarify_rejection(
    service: GetService,
    user: GetUser,
) -> RejectionDto:
    try:
        return await service.clarify_rejection(user_id=user.id)
    except SumSubAPIError as e:
        raise HTTPException(status_code=e.status, detail=e.details)
    except NoApplicationId:
        raise HTTPException(status_code=403)


@router.post(
    "/accept_webhooks",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Webhook signature verification failed"},
    },
)
async def accept_webhooks(
    service: GetService, request: Request, x_sumsub_signature: Annotated[str, Header()]
) -> BasicStatusResponse:
    raw_request = await request.body()
    try:
        await service.accept_webhooks(
            signature=x_sumsub_signature,
            raw_request=raw_request,
        )
    except WebhookSignatureVerificationFailed:
        raise HTTPException(status_code=400)

    return BasicStatusResponse()
