import logging
import time

import structlog
from structlog.typing import FilteringBoundLogger


def get_logger(name: str) -> FilteringBoundLogger:
    if not structlog.is_configured():
        # Make sure default logger would print only message, nothing else
        logging.root.removeHandler(logging.root.handlers[0])
        formatter = logging.Formatter(fmt="%(message)s")
        handler = logging.StreamHandler()
        handler.setFormatter(formatter)
        logging.root.addHandler(handler)
        # Setup messages in JSON format
        structlog.configure(
            processors=[
                structlog.stdlib.filter_by_level,
                structlog.stdlib.add_logger_name,
                structlog.stdlib.add_log_level,
                structlog.processors.TimeStamper(fmt="%Y-%m-%d %H:%M:%S.%f", utc=True),
                structlog.processors.UnicodeDecoder(),
                structlog.processors.EventRenamer("message"),
                structlog.processors.JSONRenderer(),
            ],
            logger_factory=structlog.stdlib.LoggerFactory(),
            wrapper_class=structlog.stdlib.BoundLogger,
            cache_logger_on_first_use=True,
        )
    return structlog.getLogger(name)


async def logging_middleware(request, call_next):
    logger = get_logger("requests")
    start_time = time.time()

    response = await call_next(request)

    process_time = (time.time() - start_time) * 1000
    formatted_process_time = "{0:.2f}".format(process_time)
    kwargs = dict(
        status_code=response.status_code, time=formatted_process_time, path=request.scope["path"]
    )
    logger.info(str(kwargs), **kwargs)

    return response
