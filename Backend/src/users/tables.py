import uuid

from db import Base
from sqlalchemy import (
    BigInteger,
    Boolean,
    Column,
    Date,
    DateTime,
    Enum,
    ForeignKey,
    Integer,
    Text,
    func,
)
from sqlalchemy.dialects.postgresql import UUID
from users.account_info.constants import EducationLevel, EmploymentType


class User(Base):
    __tablename__ = "users"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4, index=True)
    created_at = Column(DateTime(timezone=True), default=func.now())
    email = Column(Text)


class AccountInfo(Base):
    __tablename__ = "account_info"

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    created_at = Column(DateTime(timezone=True), default=func.now())
    user_id: Column[UUID] = Column(ForeignKey("users.id"), index=True, unique=True)

    email = Column(Text, nullable=True)
    first_name = Column(Text, nullable=True)
    last_name = Column(Text, nullable=True)
    birth_date = Column(Date, nullable=True)

    tax_id = Column(Text, nullable=True)

    country_code = Column(Text, nullable=True)
    country = Column(Text, nullable=True)
    address = Column(Text, nullable=True)
    city = Column(Text, nullable=True)
    zip_code = Column(Text, nullable=True)

    education: EducationLevel = Column(Enum(EducationLevel), nullable=True)
    car_ownership = Column(Boolean, nullable=True)
    employment_info: EmploymentType = Column(Enum(EmploymentType), nullable=True)
    monthly_income = Column(Integer, nullable=True)
