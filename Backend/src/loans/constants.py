from enum import Enum


class TransferType(str, Enum):
    INSTANT = "instant"
    REGULAR = "regular"


COMMISSION_RATES = {
    TransferType.INSTANT: 12.0,
    TransferType.REGULAR: 4.0,
}


class LoanType(str, Enum):
    INSTALLMENT = "installment"
    PAYDAY_LOAN = "payday_loan"


class PaymentStatus(str, Enum):
    CONFIRMED = "confirmed"


class InstallmentFilter(str, Enum):
    UPCOMING = "upcoming"
    HISTORICAL = "historical"
