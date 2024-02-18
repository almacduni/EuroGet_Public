from typing import Annotated

from common.http_utils import DBSession, GetUser
from fastapi import APIRouter, Depends, HTTPException, status
from loans.loan_management.services import (
    InsufficientCredit,
    LoanDto,
    LoanLimitReached,
    LoanManagementService,
    LoanRequest,
    LoanTypeIsNotPayday,
    NoPaydayLoanFound,
    PaydayLoanDto,
    UserNotFound,
)
from pydantic import BaseModel

router = APIRouter()


def create_service(
    session: DBSession,
) -> LoanManagementService:
    return LoanManagementService(session)


GetService = Annotated[LoanManagementService, Depends(create_service)]


@router.post(
    "/loan_request",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        400: {"description": "Please try another account"},
        403: {"description": "Insufficient credit"},
        404: {"description": "User is not found"},
        429: {"description": "Loan limit reached. You already have two or more active loans."},
    },
)
async def loan_request(
    service: GetService,
    request: LoanRequest,
    user: GetUser,
) -> LoanDto:
    try:
        return await service.process_loan_request(user_id=user.id, loan_request=request)
    except LoanLimitReached:
        raise HTTPException(status_code=429)
    except InsufficientCredit:
        raise HTTPException(status_code=403)
    except UserNotFound:
        raise HTTPException(status_code=404)


# class GetInstallmentsRequest(BaseModel):
#     filter: InstallmentFilter
#
#
# # TODO: maybe get?
# @router.post(
#     "/all_user_installments",
#     status_code=status.HTTP_200_OK,
#     responses={
#         200: {"description": "Success"},
#         404: {"description": "No installments found for this user."},
#     },
# )
# async def get_user_installments(
#     service: GetService,
#     request: GetInstallmentsRequest,
#     user: GetUser,
# ) -> UserInstallmentsDto:
#     try:
#         return await service.get_user_installments(user_id=user.id, filter_type=request.filter)
#     except NoInstallmentsFound:
#         raise HTTPException(status_code=404)


# class GetInstallmentDetailsRequest(BaseModel):
#     installment_id: str


# # TODO: maybe get?
# @router.post(
#     "/installment_details",
#     status_code=status.HTTP_200_OK,
#     responses={
#         200: {"description": "Success"},
#         404: {"description": "No installments found for this user."},
#     },
# )
# async def get_installment_details(
#     service: GetService,
#     request: GetInstallmentDetailsRequest,
#     user: GetUser,
# ) -> InstallmentDto:
#     try:
#         return await service.get_installment_details(
#             user_id=user.id, installment_id=request.installment_id
#         )
#     except NoInstallmentsFound:
#         raise HTTPException(status_code=404)


class GetPaydayDetailsRequest(BaseModel):
    payment_id: str


# TODO: maybe get?
@router.post(
    "/payday_details_by_user_payment",
    status_code=status.HTTP_200_OK,
    responses={
        200: {"description": "Success"},
        404: {"description": "No payday loan found"},
        400: {"description": "Loan associated with payment_id is not payday type"},
    },
)
async def get_payday_details_by_user_payment(
    service: GetService,
    request: GetPaydayDetailsRequest,
    user: GetUser,
) -> PaydayLoanDto:
    try:
        return await service.get_payday_details_by_user_payment(
            user_id=user.id, payment_id=request.payment_id
        )
    except NoPaydayLoanFound:
        raise HTTPException(status_code=404)
    except LoanTypeIsNotPayday:
        raise HTTPException(status_code=400)
