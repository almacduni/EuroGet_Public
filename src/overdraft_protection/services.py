from datetime import datetime
from decimal import Decimal

from common.logging_utils import get_logger
from common.services import Service
from gocardless.payments.services import GoCardlessPaymentsService, MandateNotFound
from loans.constants import LoanType, TransferType
from loans.credit_limits.services import CreditLimitsService
from loans.loan_management.services import LoanManagementService, LoanRequest
from overdraft_protection.tables import OverdraftProtection
from pydantic import BaseModel
from sqlalchemy import select
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.exc import NoResultFound
from sqlalchemy.ext.asyncio import AsyncSession

logger = get_logger(__name__)


class OverdraftProtectionDto(BaseModel):
    balance_limit: int
    opt_in_status: bool
    desired_sum: int = 0


class OverdraftProtectionService(Service):
    def __init__(self, session: AsyncSession):
        super().__init__(session)
        self.credit_limits = CreditLimitsService(session)
        self.payments = GoCardlessPaymentsService(session)
        self.loan_management = LoanManagementService(session)

    async def set_overdraft_protection(self, user_id: str, request: OverdraftProtectionDto):
        await self.session.execute(
            insert(OverdraftProtection)
            .values(
                balance_limit=request.balance_limit,
                opt_in_status=request.opt_in_status,
                desired_sum=request.desired_sum,
                user_id=user_id,
            )
            .on_conflict_do_update(
                index_elements=[OverdraftProtection.user_id],
                set_=dict(
                    balance_limit=request.balance_limit,
                    opt_in_status=request.opt_in_status,
                    desired_sum=request.desired_sum,
                ),
            )
        )

    # TODO: make a better name and explanation
    async def process_users(self):
        batch_size = 100

        while True:
            # Fetch all users who have opted into the overdraft protection feature
            # using batches
            query = (
                select(
                    OverdraftProtection.user_id,
                    OverdraftProtection.balance_limit,
                    OverdraftProtection.desired_sum,
                )
                .where(opt_in_status=True)
                .limit(batch_size)
            )
            try:
                raw_result = await self.session.execute(query)
                users = raw_result.all()
            except NoResultFound:
                logger.info("Processing finished")
                return

            for user in users:
                # TODO: fix when it will be moved
                # balance_data, _ = get_bank_account_balances(user.user_id)
                balance_data = {}
                if balance_data is not None:
                    balance = balance_data["balance_amount"]
                    await self._trigger_loan_if_needed(
                        user.user_id,
                        balance,
                        user.balance_limit,
                        user.desired_sum,
                    )

    async def _trigger_loan_if_needed(
        self, user_id: str, balance: Decimal, balance_limit: int, desired_sum: int
    ):
        if balance > balance_limit:
            return
        # Fetch user loan management data
        limits = await self.credit_limits.check_limit(user_id=user_id)
        credit_limit = limits.credit_limit
        active_loan = limits.active_loan

        # Calculate the sum available to be borrowed
        sum_available = credit_limit - active_loan

        # Determine the loan amount based on desired_sum and sum_available
        loan_amount = min(desired_sum, sum_available)

        # Fetch mandate id
        try:
            mandate_id = await self.payments.get_first_mandate(user_id=user_id)
        except MandateNotFound:
            logger.info(f"Mandate for user {user_id} not found")
            return

        # Set the charge date to the 5th of next month
        today = datetime.today()
        next_month = today.month + 1 if today.month < 12 else 1
        year = today.year if today.month < 12 else today.year + 1
        charge_date = datetime(year, next_month, 5)

        # Call the process_loan_request function
        try:
            await self.loan_management.process_loan_request(
                LoanRequest(
                    user_id=user_id,
                    loan_sum=loan_amount,
                    transfer_type=TransferType.INSTANT,
                    mandate_id=mandate_id,
                    loan_type=LoanType.INSTALLMENT,
                    charge_date=charge_date,
                )
            )
        except Exception:
            logger.exception(f"Failed to request loan for user {user_id}")
