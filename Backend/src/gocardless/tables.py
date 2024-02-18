import uuid

from common.tables import CachedTokensTable
from db import Base
from gocardless.constants import BankConnectionStatus
from sqlalchemy import (
    UUID,
    BigInteger,
    Column,
    DateTime,
    Enum,
    Float,
    ForeignKey,
    Text,
    func,
)
from sqlalchemy.orm import Mapped, mapped_column, relationship


class BankConnections(Base):
    __tablename__ = "gc_bank_connections"

    # main non-null attributes
    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    user_id: Column[UUID] = Column(ForeignKey("users.id"), index=True, nullable=False)
    institution_id = Column(Text, nullable=False)
    status: BankConnectionStatus = Column(
        Enum(BankConnectionStatus), default=BankConnectionStatus.PENDING, nullable=False
    )

    # first stage: create an agreement
    agreement_id = Column(Text, nullable=True)
    agreement_accepted_at = Column(DateTime(timezone=True), nullable=True)
    access_valid_for_days = Column(BigInteger)
    max_historical_days = Column(BigInteger)

    # second stage: create requisition & link
    link = Column(Text, nullable=True)
    requisition_id = Column(Text, nullable=True)

    created_at = Column(DateTime(timezone=True), default=func.now())

    accounts = relationship("BankIBAN", back_populates="bank_connection")


class BankIBAN(Base):
    __tablename__ = "gc_bank_ibans"

    # match with id on GoCardless side
    id = Column(UUID(as_uuid=True), default=uuid.uuid4, index=True, primary_key=True)

    bank_connection_id: Mapped[int] = mapped_column(
        ForeignKey("gc_bank_connections.id"), index=True, nullable=False
    )
    bank_connection: Mapped["BankConnections"] = relationship(back_populates="accounts")

    iban = Column(Text, nullable=False)
    owner_name = Column(Text, nullable=False)
    account_created = Column(DateTime(timezone=True), nullable=False)

    bank_logo = Column(Text, nullable=False)
    bank_name = Column(Text, nullable=False)

    # can be null and can be not relevant
    balance = Column(Float, nullable=True)


class PaymentUsers(Base):
    __tablename__ = "gc_payment_users"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4, index=True)
    p_customer_id = Column(Text, nullable=False)
    p_bank_account_id = Column(Text, nullable=True)
    p_mandate_id = Column(Text, nullable=True)
    user_id: Column[UUID] = Column(ForeignKey("users.id"), index=True)
    iban = Column(Text, nullable=True)
    # TODO: make enum type
    mandate_status = Column(Text, nullable=True)


class GoCardlessTokens(CachedTokensTable):
    __tablename__ = "gc_tokens"
