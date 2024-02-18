from typing import Annotated, List, Optional

from common.http_utils import DBSession, GetUser
from fastapi import APIRouter, Depends, HTTPException, status
from gocardless.search.services import (
    GoCardlessSearchService,
    InstitutionDto,
    InstitutionsDto,
    NoBankIbans,
)
from pydantic import BaseModel

router = APIRouter()


def create_service(
    session: DBSession,
) -> GoCardlessSearchService:
    return GoCardlessSearchService(session)


GetService = Annotated[GoCardlessSearchService, Depends(create_service)]


class GetInstitutionsRequest(BaseModel):
    country: Optional[str] = None
    id: Optional[str] = None


@router.post(
    "/search/institutions",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Successfully."},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def get_institutions(
    service: GetService,
    request: GetInstitutionsRequest,
) -> InstitutionsDto:
    return await service.get_institutions(country=request.country)


@router.post(
    "/search/byid",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Successfully."},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def get_institution_by_id(
    service: GetService,
    request: GetInstitutionsRequest,
) -> InstitutionDto:
    return await service.get_institution(institution_id=request.id)


@router.post(
    "/search/institutions-for-user",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Successfully."},
        400: {"description": "GoCardless API validation failed."},
        404: {"description": "No bank IBANs founded."},
    },
)
async def get_institutions_for_user(
    service: GetService,
    user: GetUser,
) -> List[InstitutionDto]:
    try:
        return await service.get_institutions_for_user(user_id=user.id)
    except NoBankIbans:
        raise HTTPException(status_code=404, detail="No bank IBANs founded")
