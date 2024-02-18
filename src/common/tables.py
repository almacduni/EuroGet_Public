from db import Base
from sqlalchemy import BigInteger, Boolean, Column, DateTime, Integer, Text, func


class CachedTokensTable(Base):
    __abstract__ = True

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    access_token = Column(Text, nullable=False)
    refresh_token = Column(Text, nullable=False)
    expires = Column(Integer, nullable=False)
    created_at = Column(DateTime(timezone=True), default=func.now(), index=True)
    is_valid = Column(Boolean, nullable=False, default=True)
