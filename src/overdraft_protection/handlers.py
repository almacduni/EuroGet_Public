from typing import Annotated

from common.http_utils import DBSession, GetUser
from common.schemas import BasicStatusResponse
from fastapi import APIRouter, Depends, status
from loans.overdraft_protection.services import OverdraftProtectionDto, OverdraftProtectionService

router = APIRouter()


def create_service(
    session: DBSession,
) -> OverdraftProtectionService:
    return OverdraftProtectionService(session)


GetService = Annotated[OverdraftProtectionService, Depends(create_service)]


@router.post(
    "/overdraft_protection",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Overdraft protection successfully set up"},
    },
)
async def set_overdraft_protection(
    service: GetService,
    request: OverdraftProtectionDto,
    user: GetUser,
) -> BasicStatusResponse:
    await service.set_overdraft_protection(user_id=user.id, request=request)

    return BasicStatusResponse()
