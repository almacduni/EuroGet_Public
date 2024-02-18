import abc
from typing import Any, Literal, Optional, Union

import httpx
from common.constants import APPLICATION_JSON
from common.logging_utils import get_logger
from common.services import Service
from db import Base
from pydantic import BaseModel
from sqlalchemy import desc, insert, select, true, update
from sqlalchemy.exc import NoResultFound
from sqlalchemy.ext.asyncio import AsyncSession

logger = get_logger(__name__)


class BaseApiError(Exception):
    def __init__(self, status: int, data: dict):
        self.data = data
        self.status = status

    def __repr__(self):
        return f"<BaseApiError(status={self.status}, data={self.data})>"


class Tokens(BaseModel):
    access_token: str
    refresh_token: str
    expires_in: int


class BaseApiClient(abc.ABC):
    def __init__(self, base_url: str):
        self.base_url = base_url

    async def request(
        self,
        method: str,
        path: str,
        data: Optional[dict] = None,
        access_token: Optional[str] = None,
        content_type: Union[
            Literal["application/json"], Literal["application/x-www-form-urlencoded"]
        ] = APPLICATION_JSON,
    ) -> dict:
        """
        Returns data dict or raise BaseApiError
        :param method:
        :param path:
        :param data:
        :param access_token:
        :param content_type:
        :return:
        """
        headers: dict[str, Any] = {
            "Content-Type": content_type,
        }
        if access_token:
            headers["Authentication"] = f"Bearer {access_token}"

        async with httpx.AsyncClient() as client:
            response = await client.request(
                method=method,
                url=f"{self.base_url}{path}",
                headers=headers,
                data=data,
            )

        if response.status_code != 200:
            response_data = response.json()
            logger.error(f"Error getting access token from API {response_data}")
            raise BaseApiError(status=response.status_code, data=response_data)

        return response.json()

    @abc.abstractmethod
    async def check_is_token_valid(self, access_token: str) -> bool:
        raise NotImplementedError()

    @abc.abstractmethod
    async def obtain_token(self) -> Tokens:
        raise NotImplementedError()

    @abc.abstractmethod
    async def refresh_token(self, refresh_token: str) -> Tokens:
        raise NotImplementedError()


class CachedTokensService(Service, abc.ABC):
    """
    Base class for GoCardless services
    """

    def __init__(self, session: AsyncSession):
        super().__init__(session)
        self.api_client = self.create_api_client()

    @abc.abstractmethod
    def create_api_client(self) -> BaseApiClient:
        raise NotImplementedError()

    @abc.abstractmethod
    def get_table(self) -> Base:
        raise NotImplementedError()

    async def _get_client_access_token(self) -> str:
        """
        Returns checked valid access token, saves access token into db
        """
        access_token, refresh_token = await self._get_saved_tokens()
        # if we have token saved, check it before usage
        if (
            access_token
            and refresh_token
            and await self.api_client.check_is_token_valid(access_token)
        ):
            return access_token

        if refresh_token:
            # renew if access token is stale
            tokens = await self.api_client.refresh_token(refresh_token)
        else:
            # if we don't have any tokens saved, request a new one
            tokens = await self.api_client.obtain_token()

        table = self.get_table()

        async with self.session.begin():
            # mark all old tokens invalid
            await self.session.execute(
                update(table).values(is_valid=False).where(table.is_valid == true())
            )
            # add a new pair of tokens
            await self.session.execute(
                insert(table).values(
                    access_token=tokens.access_token,
                    refresh_token=tokens.refresh_token,
                    expires=tokens.expires_in,
                )
            )

        return str(tokens.access_token)

    async def _get_saved_tokens(self) -> tuple[Optional[str], Optional[str]]:
        """
        Returns access_token and refresh_token from DB table if exists
        :return:
        """
        table = self.get_table()

        raw_result = await self.session.execute(
            select(table.access_token, table.refresh_token)
            .where(table.is_valid == true())
            .order_by(desc(table.created_at))
            .limit(1)
        )
        try:
            result = raw_result.one()
            access_token = result[0]
            refresh_token = result[1]
        except NoResultFound:
            return None, None

        return access_token, refresh_token
