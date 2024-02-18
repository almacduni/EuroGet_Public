from typing import Annotated

from common.http_utils import DBSession, GetUser
from fastapi import APIRouter, Depends, HTTPException, status
from loans.credit_decision.services import (
    CreditDecisionDto,
    CreditDecisionService,
    TryAnotherAccount,
)
from pydantic import BaseModel

router = APIRouter()


def create_service(
    session: DBSession,
) -> CreditDecisionService:
    return CreditDecisionService(session)


GetService = Annotated[CreditDecisionService, Depends(create_service)]


class CreditDecisionRequest(BaseModel):
    agreement_id: str


@router.post(
    "/credit_decision",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Please try another account"},
    },
)
async def credit_decision(
    service: GetService,
    request: CreditDecisionRequest,
    user: GetUser,
) -> list[CreditDecisionDto]:
    try:
        return await service.calculate_credit_decision(
            user_id=user.id, agreement_id=request.agreement_id
        )
    except TryAnotherAccount:
        raise HTTPException(status_code=400)
