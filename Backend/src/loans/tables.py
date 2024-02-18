import uuid

from db import Base
from loans.constants import LoanType
from sqlalchemy import (
    JSON,
    UUID,
    BigInteger,
    Boolean,
    Column,
    DateTime,
    Enum,
    Float,
    ForeignKey,
    Numeric,
    SmallInteger,
    Text,
    func,
)


class IssuedLoans(Base):
    __tablename__ = "issued_loans"

    loan_id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4, index=True)
    user_id = Column(
        UUID(as_uuid=True), ForeignKey("users.id", ondelete="RESTRICT"), nullable=False
    )
    sum = Column(Float, nullable=False)
    date = Column(DateTime(timezone=True), default=func.now())
    is_paid = Column(Boolean, nullable=False, default=False)
    instalment_id = Column(Text, nullable=True)
    commission = Column(Numeric, nullable=False)
    total_sum = Column(Numeric, nullable=False)

    payment_id = Column(Text, nullable=True)
    payment_status = Column(Text, nullable=True)
    type: Column[LoanType] = Column(Enum(LoanType), nullable=False)


class UserLoadManagement(Base):
    __tablename__ = "user_loan_management"

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    created_at = Column(DateTime(timezone=True), default=func.now())
    user_id: Column[UUID] = Column(ForeignKey("users.id"), index=True)
    total_loan_taken = Column(Float, nullable=True)
    total_loan_repaid = Column(Float, nullable=True)
    active_loan = Column(Float, nullable=True)
    approved = Column(Boolean)
    initial_credit_decision = Column(Text, nullable=True)
    payments_in_the_row = Column(BigInteger, nullable=True)
    missed_payments = Column(BigInteger, nullable=True)
    current_limit = Column(BigInteger, nullable=True)
    active_loan_count = Column(SmallInteger, nullable=True)


class InstallmentPayments(Base):
    __tablename__ = "installment_payments"

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    created_at = Column(DateTime(timezone=True), default=func.now())
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="SET NULL"), nullable=True)
    payment_amount = Column(BigInteger, nullable=True)
    instalment_id = Column(Text, nullable=True)
    is_part_of_instalment = Column(Boolean, nullable=True)
    status = Column(Text, nullable=True)
    charge_date = Column(DateTime(timezone=True), nullable=True)
    payment_id = Column(Text, nullable=True, unique=True)
    subscription_id = Column(Text, nullable=True)
    is_part_of_subscription = Column(Boolean, nullable=True)


class OpenBankingDataset(Base):
    __tablename__ = "ml_ob_dataset"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4, index=True)
    raw_transactions = Column(JSON, nullable=True)
    gc_account_id = Column(Text, nullable=True)
    user_id: Column[UUID] = Column(ForeignKey("users.id"), index=True)
    created_at = Column(DateTime(timezone=True), default=func.now())


class FailedPayments(Base):
    __tablename__ = "failed_payments"

    id = Column(BigInteger, primary_key=True, index=True, autoincrement=True)
    payment_id = Column(Text, nullable=True)
    cause = Column(Text, nullable=True)
    is_part_of_instalment = Column(Boolean, nullable=True)
    instalment_id = Column(Text, nullable=True)
    user_id = Column(UUID(as_uuid=True), default=uuid.uuid4, index=True)
    created_at = Column(DateTime(timezone=True), default=func.now())
