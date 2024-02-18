from typing import Any, Optional

from common.logging_utils import get_logger
from common.schemas import PhoneNumber
from common.services import Service
from gotrue import AuthResponse
from gotrue import User as GoTrueUser
from gotrue.errors import AuthApiError
from pydantic import BaseModel, EmailStr, Field, model_validator
from sqlalchemy.ext.asyncio import AsyncSession
from supabase import create_client

logger = get_logger(__name__)


class SignupRequest(BaseModel):
    email: Optional[EmailStr] = None
    phone: Optional[PhoneNumber] = Field(
        description="Phone number in global (E164) format (+XXXXX)", default=None
    )

    @model_validator(mode="after")
    def validate_email_or_phone_are_exist(self):
        if not self.phone and not self.email:
            raise ValueError("email or phone must be in the request")

        if self.phone and self.email:
            raise ValueError("email and phone can't be in same request, choose one")

        return self


class VerifyOTPRequest(BaseModel):
    otp: str
    phone: PhoneNumber


class SupabaseAuthApiError(Exception):
    def __init__(self, detail: str):
        self.detail = detail


class AuthService(Service):
    def __init__(self, session: AsyncSession):
        super().__init__(session)
        self.supabase_client = create_client(
            self.settings.supabase.url,
            self.settings.supabase.key,
        )

    def get_user_by_jwt(self, jwt: str) -> Optional[GoTrueUser]:
        try:
            response = self.supabase_client.auth.get_user(jwt=jwt)
            return response.user
        except AuthApiError as e:
            logger.warning(f"Cant get user id by token: {e.message}, token: {jwt}")
            return None

    def signup(self, request: SignupRequest):
        body: dict[str, Any] = {
            "options": {
                "email_redirect_to": "euroget://euroget.co/step3Banner",
            },
        }
        if request.email:
            body["email"] = request.email
        elif request.phone:
            body["phone"] = request.phone
        try:
            response = self.supabase_client.auth.sign_in_with_otp(body)
        except AuthApiError as e:
            logger.error(e.message)
            raise SupabaseAuthApiError(detail=e.message)

        logger.info(
            f"Signup for user with request {request.model_dump_json()}: "
            f"{response.model_dump_json()}"
        )

    def verify_otp(self, request: VerifyOTPRequest) -> AuthResponse:
        try:
            return self.supabase_client.auth.verify_otp(
                {
                    "phone": request.phone,
                    "token": request.otp,
                    "type": "sms",
                }
            )
        except AuthApiError as e:
            logger.error(e.message)
            raise SupabaseAuthApiError(detail=e.message)

    # TODO: do we need it? I don't see any mentions in docs or code
    # async def resend_verification(self, user_id: str):
    #     result = await self.session.execute(
    #         select(
    #             User.email,
    #         ).where(
    #             User.user_id == user_id
    #         )
    #     )
    #     email = result.one()[0]
    #
    #     try:
    #         response = self.supabase_client.auth.reset_email_confirm(email)
    #         if response['status_code'] != 200:
    #             raise SupabaseAuthApiError(detail=f"Auth API returned an error: {response}")
    #     except AuthApiError as e:
    #         raise SupabaseAuthApiError(detail=e.message)
