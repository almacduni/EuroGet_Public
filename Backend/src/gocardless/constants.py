from enum import Enum

MAX_HISTORICAL_DAYS = 360
ACCESS_VALID_FOR_DAYS = 180
ACCEPTED_DATE_TIMEDELTA = 89

DEFAULT_USER_LANGUAGE = "EN"

LOW_BALANCE_THRESHOLD = 750


class BankConnectionStatus(str, Enum):
    # newly created
    PENDING = "PENDING"
    # requisition (link) created, waits for user acceptance
    CREATED = "CR"
    # requisition accepted by user, waits for fetching accounts
    LINKED = "LN"

    # End-user is giving consent at GoCardless consent screen
    GIVING_CONSENT = "GC"
    # End-user is redirected to the financial institution for authentication
    UNDERGOING_AUTHENTICATION = "UA"
    # Either SSN verification has failed or end-user has entered incorrect credentials
    REJECTED = "RJ"
    # End-user is selecting accounts
    SELECTING_ACCOUNTS = "SA"
    # End-user is granting access to their account information
    GRANTING_ACCESS = "GA"
    EXPIRED = "EX"


INTERMEDIATE_STATUSES = [
    BankConnectionStatus.CREATED,
    BankConnectionStatus.GIVING_CONSENT,
    BankConnectionStatus.UNDERGOING_AUTHENTICATION,
    BankConnectionStatus.SELECTING_ACCOUNTS,
    BankConnectionStatus.GRANTING_ACCESS,
]

SUCCESS_STATUSES = [
    BankConnectionStatus.LINKED,
]

ERROR_STATUSES = [
    BankConnectionStatus.REJECTED,
    BankConnectionStatus.EXPIRED,
]

FINAL_STATUSES = SUCCESS_STATUSES + ERROR_STATUSES
