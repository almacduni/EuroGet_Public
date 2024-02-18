from db import Base
from kyc.constants import KYCStatus, ReviewAnswer
from sqlalchemy import (
    UUID,
    BigInteger,
    Column,
    DateTime,
    Enum,
    ForeignKey,
    Text,
    func,
)
from sqlalchemy.dialects.postgresql import JSONB


class KYCData(Base):
    __tablename__ = "kyc_data"

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    user_id: Column[UUID] = Column(ForeignKey("users.id"), index=True, unique=True)
    sumsub_id = Column(Text, nullable=False)

    link = Column(Text, nullable=True)
    status: Column[KYCStatus] = Column(Enum(KYCStatus), nullable=True)
    reject_labels = Column(JSONB, nullable=True)
    review_answer: Column[ReviewAnswer] = Column(Enum(ReviewAnswer), nullable=True)

    created_at = Column(DateTime(timezone=True), default=func.now())
