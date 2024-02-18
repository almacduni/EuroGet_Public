from gocardless.payments.services import MandateNotFound
from gocardless.tables import PaymentUsers
from pytest import raises
from users.tables import User


class TestGetFirstMandate:
    async def test_successful(
        self,
        user: User,
        payments_service,
        payment_users_data_factory,
        truncate,
    ):
        user_id = str(user.id)
        mock_id = "207f9981-d96c-4aa8-861a-683a1894f42e"
        await truncate(PaymentUsers.__tablename__)
        await payment_users_data_factory(
            user_id=user.id, p_customer_id=mock_id, p_mandate_id=mock_id
        )

        response = await payments_service.get_first_mandate(user_id)

        assert response.mandate_id == mock_id

    async def test_mandate_not_found(
        self,
        user: User,
        payments_service,
        truncate,
    ):
        user_id = str(user.id)
        await truncate(PaymentUsers.__tablename__)

        with (
            raises(MandateNotFound) as err,
        ):
            await payments_service.get_first_mandate(user_id)

        assert err.type == MandateNotFound
