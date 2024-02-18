from contextlib import asynccontextmanager

import sentry_sdk
from common.http_utils import start_session
from common.logging_utils import get_logger
from fastapi import FastAPI
from settings import Settings
from sqlalchemy import select, text

logger = get_logger(__name__)


@asynccontextmanager
async def lifespan(
    app: FastAPI,  # noqa: ARG001
):
    settings = Settings()
    logger.info("Set up common metrics (errors, latency)")
    app.state.metrics.expose(app)

    if settings.sentry_dsn:
        logger.info("Set up Sentry integration")
        sentry_sdk.init(
            dsn=settings.sentry_dsn,
            # Set traces_sample_rate to 1.0 to capture 100%
            # of transactions for performance monitoring.
            traces_sample_rate=1.0,
            # Set profiles_sample_rate to 1.0 to profile 100%
            # of sampled transactions.
            # We recommend adjusting this value in production.
            profiles_sample_rate=1.0,
        )

    # On startup
    logger.info("Trying to connect to db")
    async for session in start_session():
        await session.execute(select(text("1")))
        logger.info("Successfully connected to db")

    yield
    # On shutdown
