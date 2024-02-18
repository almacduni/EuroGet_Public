import os
from datetime import timezone
from decimal import Decimal
from enum import Enum
from typing import Optional

from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv()


BASE_DIR: str = os.path.dirname(os.path.abspath(__file__))


class HttpSettings(BaseSettings):
    host: str
    port: int


class DatabaseSettings(BaseSettings):
    driver: str = "postgresql+asyncpg"
    user: str
    password: str
    host: str
    port: int
    name: str

    @property
    def url(self):
        return f"{self.driver}://{self.user}:{self.password}@{self.host}:{self.port}/{self.name}"

    @property
    def migration_url(self):  # pragma: no cover
        return f"postgresql://{self.user}:{self.password}@{self.host}:{self.port}/{self.name}"


class GoCardlessSettings(BaseSettings):
    secret_id: str
    secret_key: str
    # default is Sandbox url
    base_url: str = "https://bankaccountdata.gocardless.com"
    # default is Sandbox, put 'live' for prod
    environment: str = "sandbox"
    redirect_url: str = "euroget://bankAccountConnected"


class CreditDecisionSettings(BaseSettings):
    limit_probability: Decimal = Decimal("0.65")


class SumSubSettings(BaseSettings):
    secret_key: str
    app_token: str
    base_url: str = "https://api.sumsub.com"
    ttl_in_secs: int = 600


class SupabaseSettings(BaseSettings):
    url: str
    key: str


class RevolutSettings(BaseSettings):
    # b2b.revolut.com for prod
    url: str = "https://sandbox-b2b.revolut.com/api/1.0"
    auth_code: str
    client_assertion_jwt: str


class DeploymentRole(str, Enum):
    HTTP_SERVER = "HTTP_SERVER"
    BANK_CONNECTION_PROCESSOR = "BANK_CONNECTION_PROCESSOR"


class Settings(BaseSettings):
    deployment_role: DeploymentRole = DeploymentRole.HTTP_SERVER

    http: HttpSettings = HttpSettings(_env_prefix="HTTP_")
    db: DatabaseSettings = DatabaseSettings(_env_prefix="DB_")

    gocardless: GoCardlessSettings = GoCardlessSettings(_env_prefix="GOCARDLESS_")

    sumsub: SumSubSettings = SumSubSettings(_env_prefix="SUMSUB_")

    supabase: SupabaseSettings = SupabaseSettings(_env_prefix="SUPABASE_")

    revolut: RevolutSettings = RevolutSettings(_env_prefix="REVOLUT_")

    # credit_decision = CreditDecisionSettings(_env_prefix="CD_")

    server_timezone: timezone = timezone.utc

    debug: bool = False

    sentry_dsn: Optional[str] = None
