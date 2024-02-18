import asyncio
from typing import List, Optional

from gocardless.bank_connect.services import GoCardlessBankConnectionService
from gocardless.base_service import GoCardlessService
from gocardless.client import GoCardlessHttpClient
from pydantic import BaseModel


class InstitutionDto(BaseModel):
    id: str
    name: str
    logo_url: str


class InstitutionsDto(BaseModel):
    institutions: List[InstitutionDto]


class NoBankIbans(Exception):
    pass


class GoCardlessSearchService(GoCardlessService):
    client = GoCardlessHttpClient()

    async def get_institutions(self, country: Optional[str] = None) -> InstitutionsDto:
        access_token = await self._get_client_access_token()

        path = "/api/v2/institutions/"
        if country:
            path += f"?country={country}"

        response = await self.client.request(
            method="GET",
            path=path,
            access_token=access_token,
        )
        return InstitutionsDto(**response)

    async def get_institution(
        self, institution_id: str, access_token: Optional[str] = None
    ) -> InstitutionDto:
        access_token = access_token or await self._get_client_access_token()

        data = await self.client.request(
            method="GET",
            path=f"/api/v2/institutions/{institution_id}/",
            access_token=access_token,
        )
        return InstitutionDto(**data)

    async def get_institutions_for_user(self, user_id: str) -> List[InstitutionDto]:
        # Get the bank_ibans data from the DB
        accounts = await GoCardlessBankConnectionService(self.session).get_account_balances(user_id)
        if not accounts.data:
            raise NoBankIbans()

        institution_ids = [item.institution_id for item in accounts.data]

        access_token = await self._get_client_access_token()

        coroutines = [
            self.get_institution(institution_id, access_token) for institution_id in institution_ids
        ]
        institutions_data = await asyncio.gather(*coroutines)

        return list(institutions_data)
