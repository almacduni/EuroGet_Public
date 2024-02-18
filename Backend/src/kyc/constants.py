from enum import Enum


class ReviewAnswer(str, Enum):
    RED = "RED"
    GREEN = "GREEN"


class KYCStatus(str, Enum):
    applicantReviewed = "applicantReviewed"
    applicantPending = "applicantPending"
    applicantCreated = "applicantCreated"
    applicantOnHold = "applicantOnHold"
    applicantPersonalInfoChanged = "applicantPersonalInfoChanged"
    applicantPrechecked = "applicantPrechecked"
    applicantDeleted = "applicantDeleted"
    applicantLevelChanged = "applicantLevelChanged"
    videoIdentStatusChanged = "videoIdentStatusChanged"
    applicantReset = "applicantReset"
    applicantActionPending = "applicantActionPending"
    applicantActionReviewed = "applicantActionReviewed"
    applicantActionOnHold = "applicantActionOnHold"
    applicantWorkflowCompleted = "applicantWorkflowCompleted"
