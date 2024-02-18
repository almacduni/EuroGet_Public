# Stage 1: Build and install dependencies
FROM python:3.11-slim AS builder

RUN apt -y update && \
    apt -y install libpq-dev gcc && \
    pip install poetry

COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false && poetry install

# Stage 2: Runtime stage
FROM python:3.11-slim AS runtime

COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin/uvicorn /usr/local/bin/uvicorn
COPY --from=builder /usr/local/bin/ruff /usr/local/bin/ruff
COPY --from=builder /usr/local/bin/mypy /usr/local/bin/mypy
COPY --from=builder /usr/local/bin/safety /usr/local/bin/safety

WORKDIR /app

COPY pyproject.toml .
COPY pytest.ini .
COPY alembic.ini .

COPY .env.example .env

COPY src /app/src


EXPOSE 80

CMD ["python", "src/main.py"]