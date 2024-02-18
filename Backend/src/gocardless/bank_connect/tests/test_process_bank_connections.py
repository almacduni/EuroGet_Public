from unittest import mock

import pytest
from sqlalchemy.ext.asyncio import AsyncSession
from users.tables import User


class TestProcessBankConnections:
    async def test__process_with_batch__ok(
        self,
        session: AsyncSession,
        user: User,
        bank_connection_factory,
        service,
        mock_get_access_token,
    ):
        bank_connection1 = await bank_connection_factory(user_id=user.id)
        bank_connection2 = await bank_connection_factory(user_id=user.id)

        with mock.patch(
            "gocardless.bank_connect.services.GoCardlessBankConnectionService.process_bank_connection"
        ) as process_mock, mock.patch(
            "gocardless.bank_connect.services.sleep",
            side_effect=[
                # first sleep do nothing
                lambda n: print(n),
                # second sleep should stop iterations
                InterruptedError,
            ],
        ) as sleep_mock, pytest.raises(InterruptedError):
            await service.process_bank_connections(batch_size=1, delay=5)

            process_mock.assert_has_awaits(
                calls=[
                    mock.call(bank_connection1.id),
                    mock.call(bank_connection2.id),
                ]
            )
            sleep_mock.assert_has_awaits(
                calls=[
                    mock.call(5),
                    mock.call(5),
                ]
            )
