from typing import Annotated

from common.http_utils import DBSession, GetUser
from fastapi import APIRouter, Depends, HTTPException, status
from loans.credit_limits.services import (
    CreditLimitsService,
    LimitsDto,
    PaymentStatusDto,
    UserNotFound,
)
from pydantic import BaseModel

router = APIRouter()


def create_service(
    session: DBSession,
) -> CreditLimitsService:
    return CreditLimitsService(session)


GetService = Annotated[CreditLimitsService, Depends(create_service)]


class PaymentsStatusResponse(BaseModel):
    payment_status: list[PaymentStatusDto]


@router.post(
    "/payments_in_a_row",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
    },
)
async def payments_in_a_row(
    service: GetService,
    user: GetUser,
) -> PaymentsStatusResponse:
    payments = await service.calculate_successful_payments_in_a_row(user_id=user.id)
    return PaymentsStatusResponse(payment_status=payments)


@router.post(
    "/check_limit",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        404: {"description": "User is not found"},
    },
)
async def check_limit(
    service: GetService,
    user: GetUser,
) -> LimitsDto:
    try:
        return await service.check_limit(user_id=user.id)
    except UserNotFound:
        raise HTTPException(status_code=404)
