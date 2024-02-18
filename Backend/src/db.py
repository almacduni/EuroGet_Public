from settings import Settings
from sqlalchemy import NullPool
from sqlalchemy.ext.asyncio import (
    AsyncSession,
    AsyncSessionTransaction,
    create_async_engine,
)
from sqlalchemy.orm import declarative_base

settings = Settings()
engine = create_async_engine(settings.db.url, poolclass=NullPool)

Base = declarative_base()


class TransactionalAsyncSession(AsyncSession):
    """
    Session that goes to the nested transaction
    if transaction has already started
    """

    def begin(self) -> AsyncSessionTransaction:
        return AsyncSessionTransaction(self, nested=self.in_transaction())
