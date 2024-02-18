import uuid

import factory
import pytest
from users.tables import User


@pytest.fixture
def base_factory(session):
    class BaseSQLAlchemyAsyncModelFactory(factory.alchemy.SQLAlchemyModelFactory):
        class Meta:
            abstract = True
            sqlalchemy_session = session
            # default persistence approach disable, because we trigger it manually
            # sqlalchemy_session_persistence = "flush"

        @classmethod
        async def _create(cls, model_class, *args, **kwargs):
            instance = super()._create(model_class, *args, **kwargs)
            await cls._meta.sqlalchemy_session.flush()
            await cls._meta.sqlalchemy_session.commit()
            return instance

    return BaseSQLAlchemyAsyncModelFactory


@pytest.fixture
def user_factory(base_factory):
    class UserFactory(base_factory):
        class Meta:
            model = User

        id = uuid.uuid4()
        email = factory.Sequence(lambda n: f"user{n}@fakemail.com")

    return UserFactory
