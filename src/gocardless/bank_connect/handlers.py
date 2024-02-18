from typing import Annotated

from common.http_utils import DBSession, GetUser
from fastapi import APIRouter, Depends, HTTPException, status
from gocardless.bank_connect.services import (
    BankAccountBalancesDto,
    BankConnectionDto,
    GoCardlessBankConnectionService,
    NoStatus,
)
from gocardless.constants import BankConnectionStatus
from pydantic import BaseModel

router = APIRouter()


def create_service(
    session: DBSession,
) -> GoCardlessBankConnectionService:
    return GoCardlessBankConnectionService(session)


GetService = Annotated[GoCardlessBankConnectionService, Depends(create_service)]


class StartBankConnectionRequest(BaseModel):
    institution_id: str


@router.post(
    "/ob/start-connection",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Success"},
    },
)
async def start_connection(
    service: GetService,
    request: StartBankConnectionRequest,
    user: GetUser,
) -> BankConnectionDto:
    bank_connection_id = await service.start_bank_connection(
        user_id=user.id, institution_id=request.institution_id
    )
    return BankConnectionDto(
        id=bank_connection_id,
        status=BankConnectionStatus.PENDING,
    )


@router.get(
    "/ob/get-status",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Account details uploaded successfully."},
        404: {"description": "No bank connection found."},
    },
)
async def get_bank_connection_status(
    service: GetService,
    user: GetUser,
) -> BankConnectionDto:
    try:
        return await service.get_bank_connection_status(user_id=user.id)
    except NoStatus:
        raise HTTPException(status_code=404, detail="No status found in the response.")


@router.post(
    "/ob/reprocess",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Account details uploaded successfully."},
        404: {"description": "No bank connection found."},
    },
)
async def reprocess_bank_connection(
    service: GetService,
    user: GetUser,
) -> BankConnectionDto:
    try:
        return await service.reprocess_bank_connection(user_id=user.id)
    except NoStatus:
        raise HTTPException(status_code=404, detail="No status found in the response.")


@router.get(
    "/ob/get-bank-accounts-balances",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Account details uploaded successfully."},
    },
)
async def get_bank_account_balances_route(
    service: GetService,
    user: GetUser,
) -> BankAccountBalancesDto:
    return await service.get_account_balances(user_id=user.id)
