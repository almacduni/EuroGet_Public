import asyncio
from typing import AsyncGenerator
from unittest import mock

import pytest
from common.date_utils import time_now
from db import Base, TransactionalAsyncSession, engine
from fastapi.testclient import TestClient
from gotrue import User as GoTrueUser
from gotrue import UserResponse
from main import app
from sqlalchemy import ForeignKeyConstraint, MetaData, Table, inspect, text
from sqlalchemy.ext.asyncio import async_sessionmaker
from sqlalchemy.sql.ddl import DropConstraint, DropTable
from users.tables import User


@pytest.fixture(scope="module")
def event_loop():
    loop = asyncio.get_event_loop()
    yield loop
    loop.close()


async def drop_all(connection):
    """
    Deletes every table and relation in DB (for tests set up)
    :param connection:
    :return:
    """
    meta = MetaData()
    tables = []
    all_fkeys = []

    def get_table_names(conn):
        inspector = inspect(conn)
        return inspector.get_table_names()

    table_names = await connection.run_sync(get_table_names)
    for table_name in table_names:
        fkeys = []

        def get_foreign_keys(conn):
            inspector = inspect(conn)
            return inspector.get_foreign_keys(table_name)  # noqa: B023

        foreign_keys = await connection.run_sync(get_foreign_keys)
        for fkey in foreign_keys:
            if not fkey["name"]:
                continue
            fkeys.append(ForeignKeyConstraint((), (), name=fkey["name"]))

        tables.append(Table(table_name, meta, *fkeys))
        all_fkeys.extend(fkeys)

    for fkey in all_fkeys:
        await connection.execute(DropConstraint(fkey))

    for table in tables:
        await connection.execute(DropTable(table))


@pytest.fixture(scope="module")
async def session_maker():
    async_session = async_sessionmaker(
        engine, expire_on_commit=False, class_=TransactionalAsyncSession
    )
    async with engine.begin() as conn:
        await drop_all(conn)
        await conn.run_sync(Base.metadata.create_all)
    async with engine.connect() as conn:
        yield async_session


@pytest.fixture(scope="module")
async def session(session_maker):
    async with session_maker() as session:
        yield session


@pytest.fixture
def truncate(session):
    async def truncate_func(table_name: str):
        async with session.begin():
            await session.execute(text(f"TRUNCATE TABLE {table_name}"))

    return truncate_func


@pytest.fixture
async def client() -> AsyncGenerator[TestClient, None]:
    yield TestClient(app)


@pytest.fixture
async def user(user_factory) -> User:
    return await user_factory()


@pytest.fixture
async def user_client(user: User) -> AsyncGenerator[TestClient, None]:
    """
    Returns test client, already by default authorized as user
    :param user:
    :return:
    """
    with mock.patch(
        "gotrue.SyncGoTrueClient.get_user",
        return_value=UserResponse(
            user=GoTrueUser(
                id=str(user.id),
                app_metadata={},
                user_metadata={},
                aud="authorized",
                created_at=time_now(),
            ),
        ),
    ):
        yield TestClient(app, headers={"Authorization": "Bearer fake_token"})
