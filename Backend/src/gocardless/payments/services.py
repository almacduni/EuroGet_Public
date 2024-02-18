import json
from datetime import datetime
from typing import Annotated

import gocardless_pro
from common.constants import DEFAULT_CURRENCY
from common.logging_utils import get_logger
from common.schemas import BasicStatusResponse
from fastapi import Header
from gocardless.base_service import GoCardlessService
from gocardless.tables import PaymentUsers
from gocardless_pro.errors import InvalidStateError, ValidationFailedError
from kyc.services import WebhookSignatureVerificationFailed
from loans.tables import IssuedLoans
from pydantic import BaseModel
from sqlalchemy import and_, select, update
from sqlalchemy.dialects.postgresql import insert
from sqlalchemy.exc import NoResultFound
from users.account_info.services import AccountInfoDoesntExist, AccountInfoService

logger = get_logger(__name__)


class BankAccountIsAlreadyRegistered(Exception):
    pass


class GoCardlessAPIValidationError(Exception):
    def __init__(self, message: str):
        self.message = message


class CustomerAlreadyExists(Exception):
    def __init__(self, p_customer_id: str):
        self.p_customer_id = p_customer_id


class MandateAlreadyExists(Exception):
    pass


class MandateNotFound(Exception):
    pass


class BankAccountIsNotFound(Exception):
    pass


class CreateCustomerDto(BasicStatusResponse):
    p_customer_id: str
    message: str = ""


class CreateBankAccountDto(BasicStatusResponse):
    bank_account_id: str


class MandateIdDto(BasicStatusResponse):
    mandate_id: str


class MandateStatusDto(BasicStatusResponse):
    mandate_id: str
    mandate_status: str


class PaymentDto(BaseModel):
    id: str
    status: str


class PaymentInfoDto(BaseModel):
    is_part_of_instalment: bool
    instalment_id: str
    payment_amount: int
    status: str
    charge_date: datetime
    created_at: datetime
    is_part_of_subscription: bool
    subscription_id: str


class UpdatePaymentDto(BaseModel):
    attributes: dict


class CreateInstallmentRequest(BaseModel):
    mandate_id: str
    name: str = "ACME Invoice 103"
    total_amount_in_cents: int = 20000
    currency: str = DEFAULT_CURRENCY
    app_fee: int = 10
    description: str = "Biweekly Payment"
    num_instalments: int = 4


class InstallmentDto(BaseModel):
    id: str


class InstalmentScheduleDto(BaseModel):
    payments: list
    instalment_status: str


class InstalmentApiResponse(BaseModel):
    def __init__(self, status: str, message: str):
        self.status = status
        self.message = message


# TODO: split to the particular exceptions
class InstalmentApiException(Exception):
    def __init__(self, status: str, message: str, code: int):
        self.status = status
        self.message = message
        self.code = code


class PayAllDueInstallmentsDto(BaseModel):
    response_data: dict


# class InstalmentPaymentDto(BaseModel):
#     amount: int
#     instalment_id: str


class AllInstalmentPaymentDto(BaseModel):
    amount: int
    loan_ids: str
    outstanding_breakdown: list


class PaydayLoanPaymentDto(BaseModel):
    amount: float
    payment_id: str


class SubscriptionPaymentInfoDto(BaseModel):
    status: str
    next_payment_date_unix: datetime
    next_payment_amount: datetime


class GoCardlessPaymentsService(GoCardlessService):
    """
    Service to manage payments from GoCardless
    """

    # region Managing GoCardless entities (customer, mandate)

    async def create_customer(self, user_id: str) -> CreateCustomerDto:
        query = select(PaymentUsers.p_customer_id).where(PaymentUsers.user_id == user_id)

        raw_result = await self.session.execute(query)
        try:
            p_customer_id = raw_result.one()[0]
            raise CustomerAlreadyExists(p_customer_id=p_customer_id)
        except NoResultFound:
            pass

        try:
            account_info = await AccountInfoService(self.session).get_account_info(user_id)
        except AccountInfoDoesntExist:
            raise

        # Create customer in GoCardless
        client = await self._get_client()
        customer = client.customers.create(
            params={
                "email": account_info.email,
                "given_name": account_info.first_name,
                "family_name": account_info.last_name,
                "address_line1": account_info.address,
                "city": account_info.city,
                "postal_code": account_info.zip_code,
                "country_code": account_info.country_code,
            }
        )
        logger.info("Customer creation response:", customer.attributes)

        return CreateCustomerDto(
            p_customer_id=customer.id,
        )

    async def create_bank_account(
        self, user_id: str, customer_id: str, new_iban: str
    ) -> CreateBankAccountDto:
        """
        Creates bank account via GoCardless Payments API and returns bank_account_id
        """
        # Fetch the user's basic information from the database
        try:
            account_info = await AccountInfoService(self.session).get_account_info(user_id)
        except AccountInfoDoesntExist:
            raise
        account_holder_name = f"{account_info.first_name} {account_info.last_name}"

        # Fetch existing user records in 'gc_payment_users' table
        query = select(
            PaymentUsers.id,
            PaymentUsers.iban,
            PaymentUsers.p_bank_account_id,
        ).where(PaymentUsers.user_id == user_id)

        async with self.session.begin():
            raw_result = await self.session.execute(query)
        try:
            existing_user_records = raw_result.all()
        except NoResultFound:
            existing_user_records = ()

        gc_client = await self._get_client()

        # Check if a record exists for this user
        if existing_user_records:
            for record in existing_user_records:
                record_id, iban, p_bank_account_id = record
                # For the case where a record exists
                # but does not have a bank account or IBAN associated with it
                if not iban and not p_bank_account_id:
                    try:
                        # Since no bank account is associated, attempt to create one
                        new_bank_account = gc_client.customer_bank_accounts.create(
                            params={
                                "iban": new_iban,
                                "account_holder_name": account_holder_name,
                                "links": {"customer": customer_id},
                            }
                        )

                    except ValidationFailedError as e:
                        raise GoCardlessAPIValidationError(message=str(e))

                    # Update the existing record with the new bank account details
                    async with self.session.begin():
                        await self.session.execute(
                            update(PaymentUsers)
                            .values(
                                p_bank_account_id=new_bank_account.id,
                                iban=new_iban,
                            )
                            .where(PaymentUsers.id == record_id)
                        )
                    return CreateBankAccountDto(bank_account_id=new_bank_account.id)

                elif iban == new_iban:
                    # The user already has a bank account with the same IBAN, no need to create one
                    raise BankAccountIsAlreadyRegistered()

        # If there's no existing user or other conditions are not met,
        # we follow the regular process to create a new bank account.
        try:
            new_bank_account = gc_client.customer_bank_accounts.create(
                params={
                    "iban": new_iban,
                    "account_holder_name": account_holder_name,
                    "links": {"customer": customer_id},
                }
            )

        except ValidationFailedError as e:
            raise GoCardlessAPIValidationError(message=str(e))

        async with self.session.begin():
            await self.session.execute(
                insert(PaymentUsers).values(
                    user_id=user_id,
                    p_customer_id=customer_id,
                    p_bank_account_id=new_bank_account.id,
                    iban=new_iban,
                )
            )
        return CreateBankAccountDto(bank_account_id=new_bank_account.id)

    async def create_mandate(self, user_id: str, bank_account_id: str) -> MandateIdDto:
        # Fetch the bank account to check if it's valid and retrieve the customer ID
        query = select(
            PaymentUsers.p_customer_id,
            PaymentUsers.p_mandate_id,
        ).where(
            and_(
                PaymentUsers.p_bank_account_id == bank_account_id,
                PaymentUsers.user_id == user_id,
            )
        )
        async with self.session.begin():
            raw_result = await self.session.execute(query)
        try:
            customer_id, existing_mandate = raw_result.one()
        except NoResultFound:
            raise BankAccountIsNotFound()

        # Check if a mandate already exists for this bank account
        if existing_mandate:
            raise MandateAlreadyExists()

        gc_client = await self._get_client()

        try:
            # No mandate exists, so we create a new one
            new_mandate = gc_client.mandates.create(
                params={
                    "scheme": "sepa_core",
                    "links": {"customer_bank_account": bank_account_id},
                }
            )
        except Exception as e:
            raise GoCardlessAPIValidationError(message=str(e))

        # Update the bank account record with the new mandate ID
        async with self.session.begin():
            await self.session.execute(
                update(PaymentUsers)
                .values(
                    p_mandate_id=new_mandate.id,
                )
                .where(PaymentUsers.p_bank_account_id == bank_account_id)
            )
        return MandateIdDto(mandate_id=new_mandate.id)

    async def check_mandate(self, user_id: str, mandate_id: str) -> MandateStatusDto:
        query = select(
            PaymentUsers.p_mandate_id,
        ).where(and_(PaymentUsers.p_mandate_id == mandate_id, PaymentUsers.user_id == user_id))
        async with self.session.begin():
            raw_result = await self.session.execute(query)
        try:
            raw_result.one()
        except NoResultFound:
            raise MandateNotFound()

        gc_client = await self._get_client()
        try:
            # Fetch the mandate from GoCardless
            mandate = gc_client.mandates.get(mandate_id)
        except InvalidStateError as e:
            raise GoCardlessAPIValidationError(message=str(e))

        return MandateStatusDto(mandate_status=mandate.status, mandate_id=mandate_id)

    async def get_first_mandate(self, user_id: str) -> MandateIdDto:
        # Fetch the bank account to check if it's valid and retrieve the customer ID
        query = select(
            PaymentUsers.p_mandate_id,
        ).where(PaymentUsers.user_id == user_id)
        async with self.session.begin():
            raw_result = await self.session.execute(query)
        try:
            existing_mandate = raw_result.one()
            return MandateIdDto(mandate_id=existing_mandate.p_mandate_id)
        except NoResultFound:
            raise MandateNotFound()

    # endregion

    # region Handling payday loan payments from GoCardless service

    async def calculate_payday_loan_payment(
        self, user_id: str, payment_id: str
    ) -> PaydayLoanPaymentDto:
        query = select(IssuedLoans.total_sum).where(
            IssuedLoans.payment_id == payment_id,
            IssuedLoans.user_id == user_id,
        )
        try:
            async with self.session.begin():
                raw_result = await self.session.execute(query)
            payment = raw_result.one()
        except NoResultFound:
            raise InstalmentApiException(
                status="Error", message="Payment not found in Supabase.", code=404
            )

        total_amount = payment[0]

        if total_amount == 0:
            raise InstalmentApiException(
                status="Error", message="No amount to be charged.", code=400
            )

        return PaydayLoanPaymentDto(amount=total_amount, payment_id=payment_id)

    async def process_payday_loan_payment(
        self, amount_in_cents: int, mandate_id: str, charge_date: datetime
    ) -> PaymentDto:
        gc_client = await self._get_client()
        try:
            payment_response = gc_client.payments.create(
                params={
                    "amount": amount_in_cents,
                    "currency": DEFAULT_CURRENCY,
                    "charge_date": charge_date,
                    "links": {"mandate": mandate_id},
                }
            )
        except Exception as e:
            raise GoCardlessAPIValidationError(message=str(e))

        return PaymentDto(id=payment_response.id, status=payment_response.status)

    async def cancel_payment(self, payment_id: str):
        gc_client = await self._get_client()
        try:
            # Expected that indentity is the same w/ payment_id (according to api
            # beginning w/ "PM")
            payment_response = gc_client.payments.cancel(payment_id)
        except Exception as e:
            raise GoCardlessAPIValidationError(message=str(e))

        return payment_response.status

    async def update_payment(self, payment_id: str, data: dict):
        gc_client = await self._get_client()
        try:
            payment_response = gc_client.payments.update(payment_id, params=data)
        except Exception as e:
            raise GoCardlessAPIValidationError(message=str(e))

        return UpdatePaymentDto(attributes=payment_response.attributes)

    # endregion

    # region Webhooks

    async def handle_mandate_events(self, event_entry: dict, action_type: str) -> None:
        # This function will handle different mandate events based on the action_type
        mandate_id = event_entry["links"]["mandate"]
        status_update = {
            "mandate_status": action_type
        }  # The status correstponds with the action_type
        async with self.session.begin():
            await self.session.execute(
                update(PaymentUsers)
                .values(status_update)
                .where(PaymentUsers.p_mandate_id == mandate_id)
            )

    async def handle_webhook(
        self,
        signature: Annotated[str, Header()],
        raw_request: bytes,
    ) -> BasicStatusResponse:
        # First, we verify the signature of the incoming request for security
        if not self.api_client.verify_webhook_signature(
            signature=signature, request_body=raw_request
        ):
            raise WebhookSignatureVerificationFailed()

        # Try to parse the event, and handle any potential parsing errors
        event_data = json.loads(raw_request)

        # Loop through all events in the webhook
        for event_entry in event_data["events"]:
            action_type = event_entry.get("action")
            resource_type = event_entry.get("resource_type")

            # if resource_type == "payments":
            #     payment_id = event_entry["links"]["payment"]
            #     payment_info = await self.fetch_payment(payment_id=payment_id)

            # if action_type == WebHookActionType.FAILED:
            #     await self.handle_failed_payment(event_entry, payment_info)
            # elif action_type == WebHookActionType.CONFIRMED:
            #     await self.handle_confirmed_payment(event_entry)

            if resource_type == "mandates":
                await self.handle_mandate_events(event_entry, action_type)

        # If everything went smoothly, return a success status
        return BasicStatusResponse()

    # endregion

    # region Internal

    async def _get_client(self) -> gocardless_pro.Client:
        access_token = await self._get_client_access_token()
        return gocardless_pro.Client(
            access_token=access_token, environment=self.settings.gocardless.environment
        )

    # endregion
