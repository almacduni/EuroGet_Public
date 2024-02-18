from common.http_utils import DBSession
from common.schemas import BasicStatusResponse
from fastapi import APIRouter
from sqlalchemy import select, text

router = APIRouter()


@router.get("/health")
async def health(
    session: DBSession,
):
    # Just checking that DB connection is ok
    await session.execute(select(text("1")))
    return BasicStatusResponse()
