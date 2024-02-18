import asyncio
from asyncio import sleep
from datetime import datetime, timedelta
from typing import List, Optional

from common.cached_tokens_service import BaseApiError
from common.date_utils import time_now
from common.logging_utils import get_logger
from dateutil.parser import parse
from gocardless.base_service import GoCardlessService
from gocardless.constants import (
    ACCESS_VALID_FOR_DAYS,
    DEFAULT_USER_LANGUAGE,
    ERROR_STATUSES,
    INTERMEDIATE_STATUSES,
    LOW_BALANCE_THRESHOLD,
    MAX_HISTORICAL_DAYS,
    SUCCESS_STATUSES,
    BankConnectionStatus,
)
from gocardless.tables import BankConnections, BankIBAN
from loans.tables import OpenBankingDataset
from pydantic import BaseModel, Field
from sqlalchemy import Row, select, update
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.exc import NoResultFound


class RequisitionDto(BaseModel):
    id: str
    status: BankConnectionStatus
    bank_accounts: list[str] = Field(default_factory=list)


class BankConnectionDto(BaseModel):
    id: int
    status: BankConnectionStatus
    link: Optional[str] = None


class AccountBalanceDto(BaseModel):
    balance_amount: float
    bank_logo: str
    bank_name: str
    institution_id: str
    iban: str


class BankAccountBalancesDto(BaseModel):
    data: List[AccountBalanceDto]
    low: bool


class BankConnectionAPIError(Exception):
    def __init__(self, details: str, status: str):
        self.details = details
        self.status = status


class NoStatus(Exception):
    pass


class NoBankAccounts(Exception):
    pass


class GoCardlessBankConnectionService(GoCardlessService):
    # region User-facing methods

    async def start_bank_connection(self, user_id: str, institution_id: str) -> int:
        """
        Start async bank connection process, returns BankConnections id to check status
        :param user_id: id of user
        :param institution_id: id of institution (bank)
        :return:
        """
        async with self.session.begin():
            result = await self.session.execute(
                insert(BankConnections)
                .values(
                    user_id=user_id,
                    institution_id=institution_id,
                    status=BankConnectionStatus.PENDING,
                )
                .returning(BankConnections.id)
            )
            return result.one()[0]

    async def get_bank_connection_status(self, user_id: str) -> BankConnectionDto:
        """
        Check status of async process
        :param user_id:
        :return:
        """
        result = await self.session.execute(
            select(
                BankConnections.id,
                BankConnections.status,
                BankConnections.link,
            ).where(BankConnections.user_id == user_id)
        )
        try:
            bank_connection_id, status, link = result.one()
        except NoResultFound:
            raise NoStatus()

        return BankConnectionDto(
            id=bank_connection_id,
            status=status,
            link=link,
        )

    async def reprocess_bank_connection(self, user_id: str) -> BankConnectionDto:
        """
        Manually triggers reprocessing of bank connection
        (updates accounts, their details, balances, transactions)
        :param user_id:
        :return:
        """
        bank_connection = await self.get_bank_connection_status(user_id)

        async with self.session.begin():
            await self.session.execute(
                update(BankConnections)
                .values(status=BankConnectionStatus.PENDING)
                .where(BankConnections.id == bank_connection.id)
            )

        return BankConnectionDto(
            id=bank_connection.id,
            status=BankConnectionStatus.PENDING,
        )

    async def get_account_balances(self, user_id: str) -> BankAccountBalancesDto:
        # TODO: we could fetch more relevant data
        # # check account ids for user
        # result = await self.session.execute(
        #     select(BankIBAN.id)
        #     .select_from(BankIBAN)
        #     .join(BankConnections.accounts)
        #     .where(BankConnections.user_id == user_id)
        # )
        # try:
        #     accounts = result.all()
        # except NoResultFound:
        #     raise NoBankAccounts()
        #
        # # fetch relevant balances
        # bank_accounts = [
        #     a.id for a in accounts
        # ]
        # await self._fetch_account_balances(
        #     bank_accounts=bank_accounts,
        #     access_token=await self._get_client_access_token()
        # )

        # return from DB
        result = await self.session.execute(
            select(
                BankIBAN.iban,
                BankIBAN.bank_name,
                BankIBAN.bank_logo,
                BankIBAN.balance,
                BankConnections.institution_id,
            )
            .select_from(BankIBAN)
            .join(BankConnections.accounts)
            .where(BankConnections.user_id == user_id)
        )
        accounts = result.all()

        balance_data = []
        low_balance = False

        for account in accounts:
            balance_data.append(
                AccountBalanceDto(
                    balance_amount=account.balance,
                    bank_logo=account.bank_logo,
                    bank_name=account.bank_name,
                    institution_id=account.institution_id,
                    iban=account.iban,
                )
            )
            if account.balance < LOW_BALANCE_THRESHOLD:
                low_balance = True

        return BankAccountBalancesDto(data=balance_data, low=low_balance)

    # endregion

    # region Background processing

    async def process_bank_connections(self, batch_size: int = 5, delay: int = 5):
        """
        Process all bank connection
        (supposed to be called as separate process in a background)
        :param batch_size:
        :param delay:
        :return:
        """
        logger = get_logger("process_bank_connections")

        while True:
            query = (
                select(BankConnections.id)
                .where(
                    BankConnections.status.in_(
                        INTERMEDIATE_STATUSES + [BankConnectionStatus.PENDING]
                    )
                )
                .order_by(BankConnections.created_at)
            )
            result = await self.session.execute(query)
            try:
                connections = list(result.all())
            except NoResultFound:
                logger.info("There is no connections to process")
                # sleep longer if no records to process
                await sleep(delay * 2)
                continue

            for i in range(0, len(connections), batch_size):
                batch = connections[i : i + batch_size]
                coroutines = [self.process_bank_connection(c.id) for c in batch]
                try:
                    await asyncio.gather(*coroutines)
                    logger.info(f"Batch from {i} to {i+batch_size} was processed")
                except Exception:
                    logger.exception(
                        f"During batch processing from {i} to {i+batch_size} exception occurred"
                    )

            logger.info(f"Processing finished, wait for {delay}")
            await sleep(delay)

    async def process_bank_connection(self, bank_connection_id: int):
        """
        Take bank connection on any stage and tries to finish it
        (or at least put it on farthest possible stage).

        - Creates agreement if needed
        - Creates requisition and generates a link if needed
        - Fetch status of connection (requisition) on GC side
        - Fetch accounts list, their details
        - Fetch accounts balances
        - Fetch account transactions
        :param bank_connection_id:
        :return:
        """
        gc_access_token = await self._get_client_access_token()
        bank_connection = await self._get_bank_connection(bank_connection_id)

        logger = get_logger("process_bank_connection")
        logger.bind(
            bank_connection_id=bank_connection.id,
            user_id=bank_connection.user_id,
        )

        # STAGE 1: create agreement if needed
        agreement_id = bank_connection.agreement_id
        agreement_not_created = not agreement_id or not bank_connection.agreement_accepted_at
        agreement_expired = (
            agreement_id
            and bank_connection.agreement_accepted_at is not None
            and bank_connection.access_valid_for_days is not None
            and bank_connection.agreement_accepted_at
            + timedelta(days=bank_connection.access_valid_for_days)
            < time_now()
        )
        if agreement_not_created or agreement_expired:
            agreement_id = await self._create_agreement(
                bank_connection_id=bank_connection.id,
                user_id=bank_connection.user_id,
                institution_id=bank_connection.institution_id,
                access_token=gc_access_token,
            )
        else:
            logger.info(
                "Agreement exists and not expired, skipping stage 1",
                agreement_id=agreement_id,
                agreement_accepted_at=bank_connection.agreement_accepted_at,
                access_valid_for_days=bank_connection.access_valid_for_days,
            )

        # STAGE 2: build a link for user to accept agreement if needed
        requisition_id = bank_connection.requisition_id
        if not bank_connection.link or not requisition_id:
            requisition_id = await self._create_link(
                bank_connection_id=bank_connection.id,
                agreement_id=agreement_id,
                institution_id=bank_connection.institution_id,
                access_token=gc_access_token,
            )
        else:
            logger.info(
                "Requisition is exists and link is generated, skipping stage 2",
                requisition_id=requisition_id,
                link=bank_connection.link,
            )

        # STAGE 3: fetch relevant requisition
        requisition = await self._fetch_requisition(
            requisition_id=requisition_id,
            access_token=gc_access_token,
        )
        if bank_connection.status != requisition.status:
            async with self.session.begin():
                await self.session.execute(
                    update(BankConnections)
                    .values(status=requisition.status)
                    .where(BankConnections.id == bank_connection_id)
                )
        if requisition.status in INTERMEDIATE_STATUSES:
            # it means user right now going through process, we need to give him time
            logger.info("User is in progress of bank connection", status=requisition.status)
            return
        if requisition.status in ERROR_STATUSES:
            logger.error(
                "User bank connection process failed, reset a process to try again",
                status=requisition.status,
            )
            return

        # STAGE 4: fetch user accounts shared with us, fetch balances
        if requisition.status in SUCCESS_STATUSES:
            await self._fetch_accounts_details(
                bank_connection_id=bank_connection_id,
                bank_accounts=requisition.bank_accounts,
                access_token=gc_access_token,
            )
            await self._fetch_account_balances(
                bank_accounts=requisition.bank_accounts,
                access_token=gc_access_token,
            )

            # STAGE 5: fetch user transactions
            await self._fetch_account_transactions(
                bank_accounts=requisition.bank_accounts,
                user_id=bank_connection.user_id,
                access_token=gc_access_token,
            )
        else:
            logger.warning("User bank connection not in success state", status=requisition.status)

    async def _create_agreement(
        self,
        bank_connection_id: int,
        user_id: str,
        institution_id: str,
        access_token: str,
    ) -> str:
        """
        Creates an agreement via GoCardless API and save in DB
        :param user_id:
        :param institution_id:
        :param access_token:
        :return:
        """
        max_historical_days = MAX_HISTORICAL_DAYS
        access_valid_for_days = ACCESS_VALID_FOR_DAYS

        response = {}
        error: Optional[BaseApiError] = None
        retries = 0
        while retries <= 2:
            try:
                data = {
                    "institution_id": institution_id,
                    "max_historical_days": max_historical_days,
                    "access_valid_for_days": access_valid_for_days,
                    "access_scope": ["balances", "details", "transactions"],
                }
                response = await self.api_client.request(
                    method="POST",
                    path="/api/v2/agreements/enduser/",
                    data=data,
                    access_token=access_token,
                )
                break
            except BaseApiError as error:
                retries += 1
                if error.data.get("max_historical_days"):
                    # if we try to request more than possible, trying to fix it in retries
                    max_historical_days = error.data["transaction_total_days"]

                if retries >= 2:
                    raise

        agreement_id = response.get("id")
        max_historical_days = response.get("max_historical_days")
        access_valid_for_days = response.get("access_valid_for_days")
        if not agreement_id or not max_historical_days or not access_valid_for_days:
            raise BankConnectionAPIError(
                status="error", details="Agreement ID or another key not found in the response."
            )

        # Upload data to 'gc_bank_connections' table
        async with self.session.begin():
            await self.session.execute(
                update(BankConnections)
                .values(
                    user_id=user_id,
                    institution_id=institution_id,
                    agreement_id=agreement_id,
                    max_historical_days=max_historical_days,
                    access_valid_for_days=access_valid_for_days,
                    agreement_accepted_at=response.get("accepted"),
                )
                .where(BankConnections.id == bank_connection_id)
            )
        return agreement_id

    async def _create_link(
        self,
        bank_connection_id: int,
        agreement_id: str,
        institution_id: str,
        access_token: str,
    ) -> str:
        """
        Create link (requisition) and save it in DB
        :param agreement_id:
        :param institution_id:
        :param access_token:
        :return:
        """
        try:
            response = await self.api_client.request(
                method="POST",
                path="/api/v2/requisitions/",
                data={
                    "redirect": self.settings.gocardless.redirect_url,
                    "institution_id": institution_id,
                    "reference": bank_connection_id,
                    "agreement": agreement_id,
                    "user_language": DEFAULT_USER_LANGUAGE,
                },
                access_token=access_token,
            )
        except BaseApiError as e:
            raise BankConnectionAPIError(status="error", details=f"Failed to send request: {e}")

        # Get 'id' of the most recent requisition
        requisition_id = response["id"]
        link = response["link"]

        # Update the existing connection with the new link, requisition_id, and status
        async with self.session.begin():
            await self.session.execute(
                update(BankConnections)
                .values(
                    requisition_id=requisition_id,
                    link=link,
                    status=BankConnectionStatus.CREATED,
                )
                .where(BankConnections.id == bank_connection_id)
            )
        return requisition_id

    async def _fetch_requisition(
        self,
        requisition_id: str,
        access_token: str,
    ) -> RequisitionDto:
        """
        Check status of bank connection (requisition) via GoCardless API
        :param requisition_id:
        :param access_token:
        :return:
        """
        try:
            response_data = await self.api_client.request(
                method="GET",
                path=f"/api/v2/requisitions/{requisition_id}/",
                access_token=access_token,
            )
        except BaseApiError as e:
            raise BankConnectionAPIError(
                status="error",
                details=f"Failed to fetch institution details for requisition {requisition_id}.\
                      Response: {e}",
            )
        return RequisitionDto(
            id=response_data["id"],
            status=response_data["status"],
            bank_accounts=response_data["bank_accounts"],
        )

    async def _fetch_accounts_details(
        self,
        bank_connection_id: int,
        bank_accounts: list[str],
        access_token: str,
    ):
        """
        Fetch bank account details from GoCardless API and save it in DB
        :param bank_accounts:
        :param access_token:
        :return:
        """
        requests = [
            self.api_client.request(
                method="GET",
                path=f"/api/v2/accounts/{account_id}",
                access_token=access_token,
            )
            for account_id in bank_accounts
        ]
        # get responses in parallel
        accounts_responses = await asyncio.gather(*requests)

        # gather unique institution ids
        institution_ids = {r["institution_id"] for r in accounts_responses}
        requests = [
            self.api_client.request(
                method="GET",
                path=f"/api/v2/institutions/{institution_id}",
                access_token=access_token,
            )
            for institution_id in institution_ids
        ]
        # get responses in parallel
        institution_responses = await asyncio.gather(*requests)
        institutions = {
            r["id"]: {
                "name": r["name"],
                "logo": r["logo"],
            }
            for r in institution_responses
        }

        async with self.session.begin():
            await self.session.execute(
                insert(BankIBAN)
                .values(
                    [
                        {
                            "id": account["id"],
                            "iban": account["iban"],
                            "bank_connection_id": bank_connection_id,
                            "owner_name": account["owner_name"],
                            "account_created": parse(account["created"]),
                            "bank_name": institutions[account["institution_id"]]["name"],
                            "bank_logo": institutions[account["institution_id"]]["logo"],
                        }
                        for account in accounts_responses
                    ]
                )
                .on_conflict_do_nothing(index_elements=[BankIBAN.id])
            )

    async def _fetch_account_balances(
        self,
        bank_accounts: list[str],
        access_token: str,
    ):
        """
        Fetch bank account balances from GoCardless API and save it in DB
        :param bank_accounts:
        :param access_token:
        :return:
        """
        requests = [
            self.api_client.request(
                method="GET",
                path=f"/api/v2/accounts/{account_id}/balances/",
                access_token=access_token,
            )
            for account_id in bank_accounts
        ]
        # get responses in parallel
        balances_responses = await asyncio.gather(*requests)

        update_queries = []
        for i in range(len(bank_accounts)):
            account_id = bank_accounts[i]
            response = balances_responses[i]
            update_queries.append(
                update(BankIBAN)
                .values(
                    balance=response.get("balances", [{}])[0].get("balanceAmount", {}).get("amount")
                )
                .where(BankIBAN.id == account_id)
            )

        async with self.session.begin():
            for query in update_queries:
                await self.session.execute(query)

    async def _fetch_account_transactions(
        self,
        bank_accounts: list[str],
        user_id: str,
        access_token: str,
    ):
        """
        Fetch transactions for given accounts and put into DB
        :param bank_accounts:
        :param access_token:
        :return:
        """
        # fetch transactions from GoCardless API for each account
        for account_id in bank_accounts:
            try:
                response = await self.api_client.request(
                    method="GET",
                    path=f"/api/v2/accounts/{account_id}/transactions/",
                    access_token=access_token,
                )
            except BaseApiError as e:
                raise BankConnectionAPIError(status="error", details=f"Failed to send request: {e}")

            # upload data to Supabase
            data = {
                "raw_transactions": response,
                "gc_account_id": account_id,
                "user_id": user_id,
                "created_at": datetime.now(),  # current timestamp
            }

            async with self.session.begin():
                await self.session.execute(insert(OpenBankingDataset).values(**data))

    # endregion

    # region Internal

    async def _get_bank_connection(self, bank_connection_id: int) -> Row[BankConnections]:
        query = select(BankConnections).where(
            BankConnections.id == bank_connection_id,
        )
        raw_query = await self.session.execute(query)
        return raw_query.one()[0]

    # endregion
