from datetime import date
from typing import Optional

from common.services import Service
from pydantic import BaseModel, EmailStr
from sqlalchemy import column, select
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.exc import NoResultFound
from users.account_info.constants import EducationLevel, EmploymentType
from users.tables import AccountInfo


class AccountInfoDoesntExist(Exception):
    pass


class AccountInfoDto(BaseModel):
    email: Optional[EmailStr] = None
    first_name: Optional[str] = None
    last_name: Optional[str] = None
    address: Optional[str] = None
    city: Optional[str] = None
    zip_code: Optional[str] = None
    country_code: Optional[str] = None

    birth_date: Optional[date] = None
    tax_id: Optional[str] = None
    country: Optional[str] = None
    education: Optional[EducationLevel] = None
    car_ownership: Optional[bool] = None
    employment_info: Optional[EmploymentType] = None
    monthly_income: Optional[int] = None


class AccountInfoService(Service):
    ALL_FIELDS = [
        "email",
        "first_name",
        "last_name",
        "birth_date",
        "tax_id",
        "address",
        "city",
        "zip_code",
        "country_code",
        "country",
        "education",
        "car_ownership",
        "employment_info",
        "monthly_income",
    ]

    async def get_account_info(self, user_id: str) -> AccountInfoDto:
        query = select(*[column(c) for c in self.ALL_FIELDS]).where(AccountInfo.user_id == user_id)
        async with self.session.begin():
            raw_result = await self.session.execute(query)
        try:
            result = raw_result.one()
            account_data = {self.ALL_FIELDS[i]: result[i] for i in range(len(self.ALL_FIELDS))}
            return AccountInfoDto(**account_data)
        except NoResultFound:
            raise AccountInfoDoesntExist()

    async def update_account_info(self, user_id: str, request: AccountInfoDto) -> AccountInfoDto:
        """
        Partially updates AccountInfo (only for field that's not None)
        :param user_id:
        :param request:
        :return:
        """
        data_to_update = {
            key: value for key, value in request.model_dump().items() if value is not None
        }
        query = (
            insert(AccountInfo)
            .values(user_id=user_id, **data_to_update)
            .on_conflict_do_update(index_elements=[AccountInfo.user_id], set_=data_to_update)
        )

        async with self.session.begin():
            await self.session.execute(query)

        return await self.get_account_info(user_id)
