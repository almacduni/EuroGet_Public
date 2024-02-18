from datetime import datetime
from typing import Annotated

from common.http_utils import DBSession, GetUser
from common.schemas import BasicStatusResponse
from fastapi import APIRouter, Depends, Header, HTTPException, Request, status
from gocardless.payments.services import (
    BankAccountIsAlreadyRegistered,
    BankAccountIsNotFound,
    CreateBankAccountDto,
    CreateCustomerDto,
    CustomerAlreadyExists,
    GoCardlessAPIValidationError,
    GoCardlessPaymentsService,
    InstalmentApiException,
    MandateAlreadyExists,
    MandateIdDto,
    MandateNotFound,
    MandateStatusDto,
    PayAllDueInstallmentsDto,
    PaydayLoanPaymentDto,
    PaymentDto,
    UpdatePaymentDto,
)
from kyc.services import WebhookSignatureVerificationFailed
from pydantic import BaseModel
from users.account_info.services import AccountInfoDoesntExist

router = APIRouter()


def create_service(
    session: DBSession,
) -> GoCardlessPaymentsService:
    return GoCardlessPaymentsService(session)


GetService = Annotated[GoCardlessPaymentsService, Depends(create_service)]


@router.post(
    "/p/create_customer",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Success"},
        200: {"description": "User already exists. Proceed to add bank account."},
        403: {"description": "Account info doesn't exist, fill it up first"},
    },
)
async def create_customer(
    service: GetService,
    user: GetUser,
) -> CreateCustomerDto:
    try:
        return await service.create_customer(user_id=user.id)
    except CustomerAlreadyExists as e:
        raise HTTPException(status_code=200, detail=e.p_customer_id)
    except AccountInfoDoesntExist:
        raise HTTPException(status_code=403)


class CreateBankAccountRequest(BaseModel):
    iban: str
    customer_id: str


@router.post(
    "/p/create_bank_account",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Bank account created successfully."},
        400: {"description": "GoCardless API validation failed."},
        403: {"description": "Account info doesn't exist, fill it up first."},
        409: {"description": "This IBAN is already registered."},
    },
)
async def create_bank_account(
    service: GetService,
    request: CreateBankAccountRequest,
    user: GetUser,
) -> CreateBankAccountDto:
    try:
        return await service.create_bank_account(
            user_id=user.id,
            customer_id=request.customer_id,
            new_iban=request.iban,
        )
    except GoCardlessAPIValidationError as e:
        raise HTTPException(status_code=400, detail=e.message)
    except AccountInfoDoesntExist:
        raise HTTPException(status_code=403)
    except BankAccountIsAlreadyRegistered:
        raise HTTPException(status_code=409)


class CreateMandateRequest(BaseModel):
    bank_account_id: str


@router.post(
    "/p/create_mandate",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Mandate created successfully."},
        400: {"description": "GoCardless API validation failed."},
        403: {"description": "Bank account is not found."},
        409: {"description": "Mandate already exists for this account."},
    },
)
async def create_mandate(
    service: GetService,
    request: CreateMandateRequest,
    user: GetUser,
) -> MandateIdDto:
    try:
        return await service.create_mandate(
            user_id=user.id,
            bank_account_id=request.bank_account_id,
        )
    except GoCardlessAPIValidationError as e:
        raise HTTPException(status_code=400, detail=e.message)
    except BankAccountIsNotFound:
        raise HTTPException(status_code=403)
    except MandateAlreadyExists:
        raise HTTPException(status_code=409)


class CheckMandateRequest(BaseModel):
    mandate_id: str


@router.post(
    "/p/check_mandate",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "GoCardless API validation failed."},
        404: {"description": "Mandate not found."},
    },
)
async def check_mandate(
    service: GetService,
    request: CheckMandateRequest,
    user: GetUser,
) -> MandateStatusDto:
    try:
        return await service.check_mandate(
            user_id=user.id,
            mandate_id=request.mandate_id,
        )
    except GoCardlessAPIValidationError as e:
        raise HTTPException(status_code=400, detail=e.message)
    except MandateNotFound:
        raise HTTPException(status_code=404, detail="Mandate not found.")


# @router.post(
#     "/p/create_instalment",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def create_instalment(
#     service: GetService,
#     request: CreateInstallmentRequest,
# ) -> InstallmentDto:
#     try:
#         return await service.create_instalment(request=request)
#     except GoCardlessAPIValidationError as e:
#         raise HTTPException(status_code=400, detail=e.message)


class PaydayLoanPaymentRequest(BaseModel):
    amount: int
    mandate_id: str
    charge_date: datetime


@router.post(
    "/p/payday_loan_payment",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Success"},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def payday_loan_payment(
    service: GetService,
    request: PaydayLoanPaymentRequest,
) -> PaymentDto:
    try:
        return await service.process_payday_loan_payment(
            amount_in_cents=request.amount,
            mandate_id=request.mandate_id,
            charge_date=request.charge_date,
        )
    except GoCardlessAPIValidationError as e:
        raise HTTPException(status_code=400, detail=e.message)


class CancelPaymentRequest(BaseModel):
    payment_id: str


@router.post(
    "/p/cancel_payment",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def cancel_payment(
    service: GetService,
    request: CancelPaymentRequest,
    # Is it ok to just throw `BasicStatusResponse` or we should create special
    # response?
) -> BasicStatusResponse:
    try:
        # In original version we don't check if payment not cancelled
        await service.cancel_payment(payment_id=request.payment_id)
    except GoCardlessAPIValidationError as e:
        raise HTTPException(status_code=400, detail=e.message)

    return BasicStatusResponse()


class UpdatePaymentRequest(BaseModel):
    # It's not clear what else we are expecting here
    payment_id: str
    data: dict


@router.put(
    "/p/update_payment",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Success"},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def update_payment(
    service: GetService,
    request: UpdatePaymentRequest,
) -> UpdatePaymentDto:
    try:
        return await service.update_payment(payment_id=request.payment_id, data=request.data)
    except GoCardlessAPIValidationError as e:
        raise HTTPException(status_code=400, detail=e.message)


# class IsPaymentPartOfInstalmentRequest(BaseModel):
#     payment_id: str


# @router.post(
#     "/p/is_payment_part_of_instalment",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def is_payment_part_of_instalment(
#     service: GetService,
#     request: IsPaymentPartOfInstalmentRequest,
# ) -> PaymentInfoDto:
#     try:
#         return await service.fetch_payment(payment_id=request.payment_id)
#     except GoCardlessAPIValidationError as e:
#         raise HTTPException(status_code=400, detail=e.message)


# class GetInstalmentScheduleRequest(BaseModel):
#     instalment_id: str


# @router.post(
#     "/p/get_instalment_schedule",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def get_instalment_schedule(
#     service: GetService,
#     request: GetInstalmentScheduleRequest,
#     user: GetUser,
# ) -> InstalmentScheduleDto:
#     try:
#         return await service.fetch_instalment_schedule(
#             instalment_id=request.instalment_id, user_id=user.id
#         )
#     except GoCardlessAPIValidationError as e:
#         raise HTTPException(status_code=400, detail=e.message)


# class CancelInstalmentScheduleRequest(BaseModel):
#     instalment_id: str


# @router.post(
#     "/p/cancel_instalment_schedule",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def cancel_instalment_schedule(
#     service: GetService,
#     request: CancelInstalmentScheduleRequest,
#     user: GetUser,
# ) -> InstalmentApiResponse:
#     try:
#         return await service.cancel_schedule(instalment_id=request.instalment_id, user_id=user.id)
#     except gocardless_pro.errors.InvalidStateError:
#         raise HTTPException(status_code=400, detail="Invalid instalment schedule ID")
#     except gocardless_pro.errors.GoCardlessProError as e:
#         raise HTTPException(status_code=500, detail=f"GoCardless error: {str(e)}")
#     except InstalmentApiException as e:
#         raise HTTPException(status_code=409, detail=e.message)


# class InstalmentPaymentRequest(BaseModel):
#     instalment_id: str


# @router.post(
#     "/p/payday_loan_instalment_payment",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def payday_loan_instalment_payment(
#     service: GetService,
#     request: InstalmentPaymentRequest,
#     user: GetUser,
# ) -> InstalmentApiResponse:
#     try:
#         return await service.process_payday_loan_instalment_payment(
#             instalment_id=request.instalment_id, user_id=user.id
#         )
#     except InstalmentApiException as e:
#         raise HTTPException(status_code=400, detail=e.message)


# @router.post(
#     "/p/calculate_payday_loan_instalment_payment",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def calculate_payday_loan_instalment_payment(
#     service: GetService,
#     request: InstalmentPaymentRequest,
#     user: GetUser,
# ) -> InstalmentPaymentDto:
#     try:
#         return await service.calculate_payday_loan_instalment_payment(
#             instalment_id=request.instalment_id, user_id=user.id
#         )
#     except InstalmentApiException as e:
#         raise HTTPException(status_code=400, detail=e.message)


# @router.post(
#     "/p/pay_all_due_installments",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def pay_all_due_installments(
#     service: GetService,
#     user: GetUser,
# ) -> PayAllDueInstallmentsDto:
#     try:
#         return await service.pay_all_due_installments(user_id=user.id)
#     except InstalmentApiException as e:
#         raise HTTPException(status_code=400, detail=e.message)


# @router.post(
#     "/p/calculate_all_due_installments",
#     status_code=status.HTTP_201_CREATED,
#     responses={
#         200: {"description": "Success"},
#         400: {"description": "GoCardless API validation failed."},
#     },
# )
# async def calculate_all_due_installments(
#     service: GetService,
#     user: GetUser,
# ) -> AllInstalmentPaymentDto:
#     try:
#         return await service.calculate_all_due_installments(user_id=user.id)
#     except InstalmentApiException as e:
#         raise HTTPException(status_code=400, detail=e.message)


class CreatePaydayLoanPaymentRequest(BaseModel):
    payment_id: str


@router.post(
    "/p/create_payday_loan_payday_loan_payment",
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "Success"},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def create_payday_loan_payday_loan_payment(
    service: GetService,
    request: CreatePaydayLoanPaymentRequest,
    user: GetUser,
) -> PayAllDueInstallmentsDto:
    try:
        return await service.create_payday_loan_payday_loan_payment(
            user_id=user.id,
            payment_id=request.payment_id,
        )
    except InstalmentApiException as e:
        raise HTTPException(status_code=400, detail=e.message)


class CalculatePaydayLoanPaymentRequest(BaseModel):
    payment_id: str


@router.post(
    "/p/calculate_payday_loan_payment",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "GoCardless API validation failed."},
    },
)
async def calculate_payday_loan_payment(
    service: GetService,
    request: CalculatePaydayLoanPaymentRequest,
    user: GetUser,
) -> PaydayLoanPaymentDto:
    try:
        return await service.calculate_payday_loan_payment(
            user_id=user.id, payment_id=request.payment_id
        )
    except InstalmentApiException as e:
        raise HTTPException(status_code=400, detail=e.message)


@router.post(
    "/webhook_endpoint",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Webhook signature verification failed"},
    },
)
async def handle_webhook(
    service: GetService, request: Request, x_gocardless_signature: Annotated[str, Header()]
) -> BasicStatusResponse:
    raw_request = await request.body()
    try:
        await service.handle_webhook(
            signature=x_gocardless_signature,
            raw_request=raw_request,
        )
    except WebhookSignatureVerificationFailed:
        raise HTTPException(status_code=400)

    return BasicStatusResponse()
