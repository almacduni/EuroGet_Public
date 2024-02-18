import asyncio
import logging

from common.http_utils import start_session
from common.logging_utils import get_logger, logging_middleware
from fastapi import FastAPI
from gocardless.bank_connect.handlers import router as gocardless_bank_connect_router
from gocardless.bank_connect.services import GoCardlessBankConnectionService
from gocardless.payments.handlers import router as gocardless_payments_router
from gocardless.search.handlers import router as gocardless_search_bank_router
from healthcheck import router as healthcheck_router
from kyc.handlers import router as kyc_router
from lifespan import lifespan
from loans.loan_management.handlers import router as loan_management_router
from prometheus_fastapi_instrumentator import Instrumentator
from settings import DeploymentRole, Settings
from users.account_info.handlers import router as account_router
from users.auth.handlers import router as auth_router

logger = get_logger(__name__)


app = FastAPI(title="Euroget", lifespan=lifespan)

app.middleware("http")(logging_middleware)


app.state.metrics = Instrumentator(
    excluded_handlers=["/metrics"],
    should_respect_env_var=True,
    env_var_name="ENABLE_METRICS",
).instrument(app, metric_namespace="euroget_backend")

app.include_router(
    account_router,
    prefix="/account",
)

app.include_router(
    auth_router,
    prefix="/auth",
)

app.include_router(
    loan_management_router,
    prefix="/l",
)

app.include_router(
    gocardless_payments_router,
    prefix="/gc",
)

app.include_router(
    gocardless_search_bank_router,
    prefix="/gc",
)

app.include_router(
    gocardless_bank_connect_router,
    prefix="/gc",
)

app.include_router(
    kyc_router,
    prefix="/kyc",
)

app.include_router(
    healthcheck_router,
)


def main():
    settings = Settings()

    if settings.deployment_role == DeploymentRole.HTTP_SERVER:
        import uvicorn

        uvicorn.run(
            "main:app",
            host=settings.http.host,
            port=settings.http.port,
            reload=settings.debug,
            log_level=logging.ERROR if not settings.debug else logging.DEBUG,
            loop="uvloop",
        )
    elif settings.deployment_role == DeploymentRole.BANK_CONNECTION_PROCESSOR:
        asyncio.run(start_bank_connections_processing())


async def start_bank_connections_processing():
    async for session in start_session():
        service = GoCardlessBankConnectionService(session)
        await service.process_bank_connections()


if __name__ == "__main__":
    main()
