class TestGetGocardlessProClient:
    async def test_successful(self, payments_service, mock_get_access_token):
        client = await payments_service._get_client()

        assert client
