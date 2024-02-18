from datetime import datetime, timedelta
from decimal import Decimal

from common.date_utils import time_now
from loans.constants import PaymentStatus
from loans.tables import InstallmentPayments, UserLoadManagement
from pydantic import BaseModel
from sqlalchemy import select
from sqlalchemy.orm.exc import NoResultFound

from src.common.services import Service


class UserNotFound(Exception):
    pass


class PaymentStatusDto(BaseModel):
    payment_id: str
    charge_date: datetime
    confirmed: bool


class LimitsDto(BaseModel):
    credit_limit: int
    active_loan: Decimal
    loan_available: Decimal
    funds_available: bool


class CreditLimitsService(Service):
    async def calculate_successful_payments_in_a_row(self, user_id: str) -> list[PaymentStatusDto]:
        # Fetch all payments for the given user_id from the "payments" table.
        raw_result = await self.session.execute(
            select(
                InstallmentPayments.payment_id,
                InstallmentPayments.status,
                InstallmentPayments.charge_date,
            ).where(InstallmentPayments.user_id == user_id)
        )
        try:
            payments = raw_result.all()
        except NoResultFound:
            payments = []

        # If there are no payments, return six entries with confirmed set to false.
        # TODO: why?
        if payments is None or len(payments) == 0:
            return [
                PaymentStatusDto(
                    payment_id=f"PM_DUMMY_{i}",
                    charge_date=(time_now() - timedelta(days=i)),
                    confirmed=False,
                )
                for i in range(6)
            ]

        # Filter out payments with None for charge_date.
        payments = [payment for payment in payments if payment.charge_date is not None]

        # Sort the payments based on 'charge_date'.
        sorted_payments = sorted(payments, key=lambda x: x.charge_date)

        # Get the last 6 payments.
        last_six_payments = sorted_payments[-6:]

        # Convert the status of each payment to a boolean value
        # and include the payment_id and charge_date.
        return [
            PaymentStatusDto(
                payment_id=payment.payment_id,
                charge_date=payment.charge_date,
                confirmed=payment.status == PaymentStatus.CONFIRMED,
            )
            for payment in last_six_payments
        ]

    async def check_limit(self, user_id: str) -> LimitsDto:
        # Fetch the user's loan management data.
        query = select(
            UserLoadManagement.current_limit,
            UserLoadManagement.active_loan,
        ).where(UserLoadManagement.user_id == user_id)
        try:
            raw_result = await self.session.execute(query)
            (
                current_limit,
                active_loan,
            ) = raw_result.one()
        except NoResultFound:
            raise UserNotFound()

        # Extract data with fallback for non-existent fields.
        credit_limit = current_limit or 0
        active_loan = active_loan or 0

        # Calculate the available credit.
        funds_available = credit_limit - active_loan
        return LimitsDto(
            credit_limit=credit_limit,
            active_loan=active_loan,  # Adding 'active_loan' to the response
            loan_available=funds_available,
            funds_available=funds_available
            > 0,  # Indicates whether any funds are available for loan.
        )
