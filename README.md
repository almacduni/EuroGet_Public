# Euroget Backend

![pipeline](https://gitlab.com/euroget/backend/euroget_backend/badges/main/pipeline.svg)
![coverage](https://gitlab.com/euroget/backend/euroget_backend/badges/main/coverage.svg)

## Glossary

**KYC** - "Know your customer" - is the mandatory process of identifying and verifying the client's identity  when give them loan.
We use service SumSub for it, here is their API documentation:
https://developers.sumsub.com/api-reference

**Loan** - A financial agreement where a lender provides funds to a borrower,
who agrees to repay the amount over a specified period.
We primary use Gocardless for everything related to transferring money or charging a customer,
here is their API docs https://developer.gocardless.com/api-reference/

**Installment** - A method of repaying a loan in which payments are divided into equal amounts over the loan's duration.
We use Gocardless to create and manage installments.

**Payday loan** - A short-term loan due on the borrower's next paycheck,
facilitated through GoCardless's payment services.

**Overdraft** - In the context of EuroGet, it is a condition when the customer has low or negative balance.
Credit limit - The maximum amount of credit a financial institution extends to a client.

**Open banking** - A banking practice that provides third-party financial service providers
open access to consumer banking, transaction, and other financial data from banks
and non-bank financial institutions

**Bank connection** - process of giving us rights to fetch user's transactions, 
bank account info, etc.

**Requisition** - entity on GoCardless API side, used to give us rights 
to fetch transactions/info/balance of user's bank accounts. Requisition: Bank Account is 1:M.
Basically the same as "Bank connection".

**Bank IBAN** - International Bank Account Number, a globally recognized system
to identify individual bank accounts across national borders

**Mandate** - An authorization for GoCardless to process payments from a bank account.

**Requisition (open banking)** - A formal request for payment processing
in the context of open banking, where it's initiated upon a customer connecting their bank account,
efficiently managed through GoCardless's platform

**Agreement  (open banking)** - A contract between a client and a financial institution,
governed by open banking regulations, supported by GoCardless

**Repay** - user action of manually pay now any debt they have

## Auth procedure

We manage authorization through Supabase Auth platform,
all questions related to tokens, their checks, refresh etc managed by external provider.

### User sign up

![Sign up diagram](https://www.plantuml.com/plantuml/png/jP5FQyCm3CNl_XGYzz9x8QFxqyCEOuLkjqAH7RKnIvnWAHtzzhCICpgwmZROfHLwF-czo4iMZ3AqZK4dNOHNfWZ8CAH_qoV9EzzZ42XMG-mE973VU0fIAEJ6ydli3jqRXMhax5H_1JT3ZnQPu7RzE59iJOKozHvoeVtA6bEMi6hHDy3-46P33sLfD2BCRdAA1Hmwa6u4aiuk4WKpQKhb30kOuo3rVCAsuTrB3QIhJIOKPfiuHNO-x1JPTT8RjggfxG9OoUUNzJIRfIgD9LyK6Ydm0Gejk011sz15v4YLZ-I4DVdKp97FASOZ0Jf7p839Dj8-4jTf9kNT1jZ7hlrSDTvgNNU1_kTMlQx-uwqsJvkB9Ec7ugZgPoXoFSYHej-VPcd_HG2LvAJMFtqBjkSEL-_BvrOvz7Nujwzdbcdpq3OV)

After signing up client stores JWT access_token and refresh_token, manages refreshing cycle.

### Token check

Client must put access_token on behalf of user. It could be done by two ways:

1. Set `sb-access-token` cookie and pass it to every backend request.
   By default, when user redirected to client, cookie is being set automatically.
2. Pass header `Authorization: Bearer <token>` header to every backend request.

![Token check diagram](https://www.plantuml.com/plantuml/png/RT2zJWCn30VmtK_nLtVK_GPKG0niI8WD2JavYmijIOWTzVL9qWm5CSMIV_vm3cfSh7wTYBsbWbUL0bRKzb9kgU13vcZOFTQIFiJmS0eIRTUH7-7_x9xzKU8wdBl4l-5BpUnO1NVFJqEf8w8-5pUti_M2DO6zXHJn5crZGv7l6eeekDf65zOBvenb055h_Xni6moRy2fbxrCw1g59UvMw1PbLyNasMCA-hVu-RbVtfwlL4Z5IL_Kp77lEmRBEZQ_TFASPpIcg41rQfdtx3m00)


## User onboarding

User checking process consist of:
- User fills up form, we check user form for **hard rejection** (have a job, funds etc.)
- User connect a bank account
- User pass KYC
- We analyze user account's transactions
- We approve certain credit limit for user (or decline completely)
From this point user is free to request a loan within credit limit.
  
### User form, hard rejection 

TBD, probably just API call.
Put approval data in some table.

### User connect a bank account

- Create agreement
- Create link (requisition)
- Fetch accounts, their balances
- Fetch accounts transactions

![Bank connection diagram](https://www.plantuml.com/plantuml/png/hPDFRzim3CNl_XH43yDs28BzsGu1ChHBiw7OC0pxWrrseILM5M9BcKYbNt-WOyEgOpI7zMG1_8bFZto-PC4akMqgD18J_69AW0oPALLxJEADtsCGkDZc51q9R1fFGIuKCjrn7lk0PaV1TbnzF3y45N0fvc3XTqmxIXrwhyU9yZKAriZK0RP-MFmKDvXiGynmzUscGvofglKQVWWwWfShC8bG2D0befQ2m7fTgJzOlEyjh23HtqmiWCR470HC386C-1Yg8w9mxsC5IsUMiLvsiriKQ0yeQ-iLC1wexAGpzWSK6cmUFmFkgDJbekhCgOknF6gDnN40huQhqFYmW-VgrBDNYHSwYLcL0fhHASk0mNQTAqjJUyKhNg_W8ucvww_gnMTTsDJnhKyjQZDzJnFZ7d8Gtm0BIcRm39llswkVs-j7Tk585aT-kWL7KgWUcV7L8rnaGN8w9JN1nGCqGSfQdyW8I8GnYYEcGnsM2ZM6tP2mofbHS-pJ-T9ccHyncsYVeY4-yTfYsXKP0kG_8H1Pijgp9kZlaVsFB0uZRUY0GVevpSPaWbJpo_roy_Np4-xsx4hdDybtyHuu6nqFjCICZie4lnaIt2yGB0dwXa__eTiIuu6R6z2KAUJUJkLgR30OEgytWFE2KsXKV3TLb8I1iGl0UTKIdbUU0oyfsDms_m00)


### User pass KYC

TBD

### We analyze user account's transactions

- fetch transactions
- fetch account details
- put it in DB
- analyze with model, put credit limit in some table


## Loan

- Check credit limit 
- Check no active loans
- We check users mandate, account (to be able to change them)
- Create customer, mandate if not active/new
- Payout via Revolut API
  TODO: store out payments
- Save loan info


### Check credit limit

from DB from previous step

### We check users mandate, account

check if their account connected, customer created, mandate is valid

### Payout via Revolut API

### Save loan info


## Receive scheduled payment

TODO: drop one_off_installment table
store payday_loan payments

- Successful payment
- Update loan info (it's closed)


- Failed payment
- Notifications (for user and for us)
- Manual create payment

## Repay

TODO: delete update payment
TODO: prohibit repays if < 10min before scheduled payment

- User click "Pay now" 
- Check if user have enough on the account
- We create new payment with current date
- If successfully paid, cancel first payment, 
- If payment failed, send notification

## Read/send notifications

TODO


## How to contribute

### Install dependencies

```shell
pip install poetry
make install
pre-commit install
```

### Run linters

```shell
make fmt # format code and fix lint errors
make lint
make mypy
make safety
```

### Run tests

```shell
make test
# coverage results will be in terminal as well as in htmlcov folder
make coverage 
```

### Add new dependency

```shell
poetry add "dependency-name"
make lock 
```
