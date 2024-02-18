from typing import Annotated, Optional, Union

from db import TransactionalAsyncSession, engine
from fastapi import Cookie, Depends, HTTPException
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from gotrue import User as GoTrueUser
from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker
from users.auth.services import AuthService


async def start_session():
    async_session = async_sessionmaker(
        engine, expire_on_commit=False, class_=TransactionalAsyncSession
    )
    async with engine.connect(), async_session() as session:  # pragma: no cover
        yield session


DBSession = Annotated[AsyncSession, Depends(start_session)]


async def get_user_or_error(
    session: DBSession,
    sb_access_token: Annotated[Union[str, None], Cookie(alias="sb-access-token")] = None,
    credentials: Annotated[
        Union[HTTPAuthorizationCredentials, None], Depends(HTTPBearer(auto_error=False))
    ] = None,
) -> Optional[GoTrueUser]:
    """
    Returns user, based on sb-access-token cookie or Authorization: Bearer header
    or 401 HTTP error if not authorized
    :return:
    """
    if not sb_access_token and not credentials:
        raise HTTPException(status_code=401)
    user = _get_user_or_none(
        session,
        cookie_token=sb_access_token,
        bearer_token=credentials.credentials if credentials else None,
    )
    if not user:
        raise HTTPException(status_code=401)
    return user


def _get_user_or_none(
    session: DBSession,
    cookie_token: Optional[str],
    bearer_token: Optional[str],
):
    token = cookie_token or bearer_token
    if not token:
        return None

    auth = AuthService(session)
    return auth.get_user_by_jwt(jwt=token)


GetUser = Annotated[Optional[GoTrueUser], Depends(get_user_or_error)]
GetUserOrNone = Annotated[Optional[GoTrueUser], Depends(get_user_or_error)]
