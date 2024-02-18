from typing import Annotated

from common.http_utils import DBSession, GetUser
from fastapi import APIRouter, Depends, status
from users.account_info.services import AccountInfoDto, AccountInfoService

router = APIRouter()


def create_service(
    session: DBSession,
) -> AccountInfoService:
    return AccountInfoService(session)


GetService = Annotated[AccountInfoService, Depends(create_service)]


@router.put(
    "/update-info",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Auth API error returned"},
    },
)
async def update_account_info(
    service: GetService,
    request: AccountInfoDto,
    user: GetUser,
) -> AccountInfoDto:
    return await service.update_account_info(user_id=user.id, request=request)
