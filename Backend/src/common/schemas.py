from pydantic import BaseModel
from pydantic_extra_types.phone_numbers import PhoneNumber as PydanticPhoneNumber


class BasicStatusResponse(BaseModel):
    status: str = "success"


class PhoneNumber(PydanticPhoneNumber):
    """Global phone number data type."""

    phone_format = "E164"
