from db import Base
from sqlalchemy import (
    UUID,
    BigInteger,
    Boolean,
    Column,
    DateTime,
    Float,
    ForeignKey,
    func,
)


class OverdraftProtection(Base):
    __tablename__ = "overdraft_protection"

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    created_at = Column(DateTime(timezone=True), default=func.now())
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=True, unique=True)
    balance_limit = Column(Float, nullable=True)
    opt_in_status = Column(Boolean, nullable=True)
    desired_sum = Column(Float, nullable=True)
