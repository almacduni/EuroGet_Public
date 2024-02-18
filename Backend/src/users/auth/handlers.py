from typing import Annotated

from common.http_utils import DBSession, GetUser
from common.schemas import BasicStatusResponse
from fastapi import APIRouter, Depends, HTTPException, status
from gotrue import AuthResponse
from gotrue import User as GoTrueUser
from users.auth.services import AuthService, SignupRequest, SupabaseAuthApiError, VerifyOTPRequest

router = APIRouter()


def create_service(
    session: DBSession,
) -> AuthService:
    return AuthService(session)


GetService = Annotated[AuthService, Depends(create_service)]


@router.post(
    "/signup",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Auth API error returned"},
    },
)
def signup(
    service: GetService,
    request: SignupRequest,
) -> BasicStatusResponse:
    try:
        service.signup(request=request)
    except SupabaseAuthApiError as e:
        raise HTTPException(status_code=502, detail=e.detail)

    return BasicStatusResponse()


@router.post(
    "/verify-otp",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Auth API error returned"},
    },
)
def verify_otp(
    service: GetService,
    request: VerifyOTPRequest,
) -> AuthResponse:
    try:
        return service.verify_otp(request=request)
    except SupabaseAuthApiError as e:
        raise HTTPException(status_code=502, detail=e.detail)


@router.get(
    "/me",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        401: {"description": "Not authorized"},
    },
)
async def me(
    user: GetUser,
) -> GoTrueUser:
    return user
