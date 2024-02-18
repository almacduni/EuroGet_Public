import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start openBanking Group Code

class OpenBankingGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app/gc/ob';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateAgreementCall createAgreementCall = CreateAgreementCall();
  static CreatelLnkCall createlLnkCall = CreatelLnkCall();
  static GetAllAccountsCall getAllAccountsCall = GetAllAccountsCall();
  static AccountTransactionsCall accountTransactionsCall =
      AccountTransactionsCall();
  static FetchBankDetailsCall fetchBankDetailsCall = FetchBankDetailsCall();
  static GcobcheckstatusCall gcobcheckstatusCall = GcobcheckstatusCall();
  static GcobgetbankaccountbalancesCall gcobgetbankaccountbalancesCall =
      GcobgetbankaccountbalancesCall();
}

class CreateAgreementCall {
  Future<ApiCallResponse> call({
    String? institutionId = '',
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "institution_id": "${institutionId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAgreement',
      apiUrl: '${OpenBankingGroup.baseUrl}/create_agreement',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  dynamic agreement(dynamic response) => getJsonField(
        response,
        r'''$.agreement_id''',
      );
}

class CreatelLnkCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "agreement_id": "${agreementId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createlLnk',
      apiUrl: '${OpenBankingGroup.baseUrl}/create_link',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic link(dynamic response) => getJsonField(
        response,
        r'''$.link''',
      );
  dynamic requisition(dynamic response) => getJsonField(
        response,
        r'''$.requisition_id''',
      );
}

class GetAllAccountsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "agreement_id": "${agreementId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllAccounts',
      apiUrl: '${OpenBankingGroup.baseUrl}/get_all_accounts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AccountTransactionsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "agreement_id": "${agreementId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'accountTransactions',
      apiUrl: '${OpenBankingGroup.baseUrl}/account_transactions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchBankDetailsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "agreement_id": "${agreementId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchBankDetails',
      apiUrl: '${OpenBankingGroup.baseUrl}/fetch_bank_details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GcobcheckstatusCall {
  Future<ApiCallResponse> call({
    String? requisitionId = '',
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "requisition_id": "${requisitionId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gcobcheckstatus',
      apiUrl: '${OpenBankingGroup.baseUrl}/gc/ob/check_status',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GcobgetbankaccountbalancesCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? agreementId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gcobgetbankaccountbalances',
      apiUrl: '${OpenBankingGroup.baseUrl}/get_bank_account_balances',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

/// End openBanking Group Code

/// Start supabase Group Code

class SupabaseGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app/supabase';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetDataCall getDataCall = GetDataCall();
  static UploadAccountInfoCall uploadAccountInfoCall = UploadAccountInfoCall();
  static UploadOnboardingPersistenceCall uploadOnboardingPersistenceCall =
      UploadOnboardingPersistenceCall();
  static UpdateOnboardingPersistenceCall updateOnboardingPersistenceCall =
      UpdateOnboardingPersistenceCall();
  static UploadFeedbackCall uploadFeedbackCall = UploadFeedbackCall();
  static UploadSupportCall uploadSupportCall = UploadSupportCall();
  static UpdateAccountInfoCall updateAccountInfoCall = UpdateAccountInfoCall();
  static UpdateApplicationsCall updateApplicationsCall =
      UpdateApplicationsCall();
  static UploadUsersCall uploadUsersCall = UploadUsersCall();
  static UploadNPSCall uploadNPSCall = UploadNPSCall();
}

class GetDataCall {
  Future<ApiCallResponse> call({
    String? tableName = '',
    String? fields = '',
    String? filterVariable = '',
    String? filterName = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "${tableName}",
  "fields": "${fields}",
  "filter": "${filterName}=eq.${filterVariable}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getData',
      apiUrl: '${SupabaseGroup.baseUrl}/get_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  dynamic link(dynamic response) => getJsonField(
        response,
        r'''$[:].link''',
      );
}

class UploadAccountInfoCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? role = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "account_info",
  "data": {
    "user_id": "${userId}",
    "email": "${email}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadAccountInfo',
      apiUrl: '${SupabaseGroup.baseUrl}/upload_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadOnboardingPersistenceCall {
  Future<ApiCallResponse> call({
    String? status = '',
    bool? completed,
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "onboarding_persistance",
  "data": {
    "user_id": "${userId}",
    "completed": ${completed},
    "status": "${status}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadOnboardingPersistence',
      apiUrl: '${SupabaseGroup.baseUrl}/upload_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOnboardingPersistenceCall {
  Future<ApiCallResponse> call({
    String? status = '',
    int? step,
    bool? completed,
    String? pageRoute = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "onboarding_persistance",
  "primary_key_col": "user_id",
  "primary_key_val": "${userId}",
  "data": {
    "step": ${step},
    "completed": ${completed},
    "pageRoute": "${pageRoute}",
    "status": "${status}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateOnboardingPersistence',
      apiUrl: '${SupabaseGroup.baseUrl}/update_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadFeedbackCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? email = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "feedback",
  "data": {
    "user_id": "${userId}",
    "email": "${email}",
    "message": "${message}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadFeedback',
      apiUrl: '${SupabaseGroup.baseUrl}/upload_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadSupportCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? inquiry = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "support_tickets",
  "data": {
    "user_id": "${userId}",
    "inquiry": "${inquiry}",
    "email": "${email}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadSupport',
      apiUrl: '${SupabaseGroup.baseUrl}/upload_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAccountInfoCall {
  Future<ApiCallResponse> call({
    String? lastName = '',
    String? firstName = '',
    String? city = '',
    String? address = '',
    String? country = '',
    String? countryCode = '',
    String? zipCode = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "account_info",
  "primary_key_col": "user_id",
  "primary_key_val": "${userId}",
  "data": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "country": "${country}",
    "address": "${address}",
    "country_code": "${countryCode}",
    "zip_code": "${zipCode}",
    "city": "${city}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateAccountInfo',
      apiUrl: '${SupabaseGroup.baseUrl}/update_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateApplicationsCall {
  Future<ApiCallResponse> call({
    String? employerName = '',
    String? position = '',
    bool? fullTime,
    int? salary,
    int? employmentType,
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "applications",
  "primary_key_col": "user_id",
  "primary_key_val": "${userId}",
  "data": {
    "employer_name": "${employerName}",
    "full_time": ${fullTime},
    "employment_type": ${employmentType},
    "position": "${position}",
    "salary": ${salary}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateApplications',
      apiUrl: '${SupabaseGroup.baseUrl}/update_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadUsersCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? role = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "users",
  "data": {
    "id": "${userId}",
    "role": "${role}",
    "email": "${email}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadUsers',
      apiUrl: '${SupabaseGroup.baseUrl}/upload_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadNPSCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? nps,
    String? message = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "table_name": "nps_scores",
  "data": {
    "user_id": "${userId}",
    "message": "${message}",
    "nps": ${nps}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadNPS',
      apiUrl: '${SupabaseGroup.baseUrl}/upload_data',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End supabase Group Code

/// Start gcPayments Group Code

class GcPaymentsGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app/gc/p';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
  static CreatebankaccountCall createbankaccountCall = CreatebankaccountCall();
  static CreatemandateCall createmandateCall = CreatemandateCall();
  static CheckmandateCall checkmandateCall = CheckmandateCall();
  static OneoffpaymentCall oneoffpaymentCall = OneoffpaymentCall();
  static CreateinstalmentCall createinstalmentCall = CreateinstalmentCall();
  static CancelpaymentCall cancelpaymentCall = CancelpaymentCall();
  static IspaymentpartofinstalmentCall ispaymentpartofinstalmentCall =
      IspaymentpartofinstalmentCall();
  static GetinstalmentscheduleCall getinstalmentscheduleCall =
      GetinstalmentscheduleCall();
  static CalculateoneoffinstalmentpaymentCall
      calculateoneoffinstalmentpaymentCall =
      CalculateoneoffinstalmentpaymentCall();
  static OneoffinstalmentpaymentCall oneoffinstalmentpaymentCall =
      OneoffinstalmentpaymentCall();
  static PayalldueinstallmentsCall payalldueinstallmentsCall =
      PayalldueinstallmentsCall();
  static CalculatealldueinstallmentsCall calculatealldueinstallmentsCall =
      CalculatealldueinstallmentsCall();
  static SubscriptionpaymentinfoCall subscriptionpaymentinfoCall =
      SubscriptionpaymentinfoCall();
}

class CreateCustomerCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCustomer',
      apiUrl: '${GcPaymentsGroup.baseUrl}/create_customer',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatebankaccountCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "iban": "${iban}",
  "customer_id": "${customerId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createbankaccount',
      apiUrl: '${GcPaymentsGroup.baseUrl}/create_bank_account',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatemandateCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "bank_account_id": "${bankAccountId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createmandate',
      apiUrl: '${GcPaymentsGroup.baseUrl}/create_mandate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckmandateCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mandate_id": "${mandateId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkmandate',
      apiUrl: '${GcPaymentsGroup.baseUrl}/check_mandate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OneoffpaymentCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "mandate_id": "${mandateId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'oneoffpayment',
      apiUrl: '${GcPaymentsGroup.baseUrl}/one_off_payment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateinstalmentCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? totalAmount,
    String? currency = '',
    int? appFee,
    String? description = '',
    int? numInstalments,
    int? amountPerInstalment,
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
     {
       "mandate_id": "${mandateId}",
       "name": "${name}",
       "total_amount": ${totalAmount},
       "currency": "${currency}",
       "app_fee": ${appFee},
       "description": "${description}",
       "num_instalments": ${numInstalments},
       "amount_per_instalment": ${amountPerInstalment}
     }''';
    return ApiManager.instance.makeApiCall(
      callName: 'createinstalment',
      apiUrl: '${GcPaymentsGroup.baseUrl}/create_instalment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelpaymentCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "payment_id": "${paymentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelpayment',
      apiUrl: '${GcPaymentsGroup.baseUrl}/cancel_payment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class IspaymentpartofinstalmentCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "payment_id": "${paymentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ispaymentpartofinstalment',
      apiUrl: '${GcPaymentsGroup.baseUrl}/is_payment_part_of_instalment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetinstalmentscheduleCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "instalment_id": "${instalmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getinstalmentschedule',
      apiUrl: '${GcPaymentsGroup.baseUrl}/get_instalment_schedule',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculateoneoffinstalmentpaymentCall {
  Future<ApiCallResponse> call({
    String? loanId = '',
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "instalment_id": "${instalmentId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'calculateoneoffinstalmentpayment',
      apiUrl: '${GcPaymentsGroup.baseUrl}/calculate_one_off_instalment_payment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OneoffinstalmentpaymentCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "instalment_id": "${instalmentId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'oneoffinstalmentpayment',
      apiUrl: '${GcPaymentsGroup.baseUrl}/one_off_instalment_payment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PayalldueinstallmentsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payalldueinstallments',
      apiUrl: '${GcPaymentsGroup.baseUrl}/pay_all_due_installments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculatealldueinstallmentsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'calculatealldueinstallments',
      apiUrl: '${GcPaymentsGroup.baseUrl}/calculate_all_due_installments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionpaymentinfoCall {
  Future<ApiCallResponse> call({
    String? subscriptionId = '',
    String? userId = '',
    String? customerId = '',
    String? bankAccountId = '',
    String? mandateId = '',
    String? paymentId = '',
    String? instalmentId = '',
    String? iban = '',
  }) async {
    final ffApiRequestBody = '''
{
  "subscription_id": "${subscriptionId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subscriptionpaymentinfo',
      apiUrl: '${GcPaymentsGroup.baseUrl}/subscription_payment_info',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End gcPayments Group Code

/// Start membership Group Code

class MembershipGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app/member';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static MemberCreateCall memberCreateCall = MemberCreateCall();
  static ChecksubscriptionCall checksubscriptionCall = ChecksubscriptionCall();
  static SubscribeCall subscribeCall = SubscribeCall();
  static CancelplanCall cancelplanCall = CancelplanCall();
}

class MemberCreateCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? mandateId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'memberCreate',
      apiUrl: '${MembershipGroup.baseUrl}/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ChecksubscriptionCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? mandateId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checksubscription',
      apiUrl: '${MembershipGroup.baseUrl}/check_subscription',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscribeCall {
  Future<ApiCallResponse> call({
    String? subscriptionType = '',
    String? userId = '',
    String? mandateId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "mandate_id": "${mandateId}",
  "subscription_type": "${subscriptionType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subscribe',
      apiUrl: '${MembershipGroup.baseUrl}/subscribe',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelplanCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? mandateId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelplan',
      apiUrl: '${MembershipGroup.baseUrl}/cancel_plan',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End membership Group Code

/// Start bankSearch Group Code

class BankSearchGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app/gc/search';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static InstitutionsCall institutionsCall = InstitutionsCall();
  static BankibansCall bankibansCall = BankibansCall();
}

class InstitutionsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? country = '',
  }) async {
    final ffApiRequestBody = '''
{
  "country": "${country}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'institutions',
      apiUrl: '${BankSearchGroup.baseUrl}/institutions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BankibansCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? country = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bankibans',
      apiUrl: '${BankSearchGroup.baseUrl}/bank_ibans',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End bankSearch Group Code

/// Start loanManagement Group Code

class LoanManagementGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static LoanrequestCall loanrequestCall = LoanrequestCall();
  static CheckLimitCall checkLimitCall = CheckLimitCall();
  static AllUserinstallmentsCall allUserinstallmentsCall =
      AllUserinstallmentsCall();
  static InstallmentdetailsCall installmentdetailsCall =
      InstallmentdetailsCall();
  static PaydaydetailsbyuserpaymentCall paydaydetailsbyuserpaymentCall =
      PaydaydetailsbyuserpaymentCall();
  static PaymentsinarowCall paymentsinarowCall = PaymentsinarowCall();
}

class LoanrequestCall {
  Future<ApiCallResponse> call({
    int? loanSum,
    String? mandateId = '',
    String? transferType = '',
    String? loanType = '',
    String? chargeDate = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "loan_sum": ${loanSum},
  "transfer_type": "${transferType}",
  "loan_type": "${loanType}",
  "charge_date": "${chargeDate}",
  "mandate_id": "${mandateId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loanrequest',
      apiUrl: '${LoanManagementGroup.baseUrl}/l/loan_request',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckLimitCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkLimit',
      apiUrl: '${LoanManagementGroup.baseUrl}/l/check_limit',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AllUserinstallmentsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "filter": "${filter}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'allUserinstallments',
      apiUrl: '${LoanManagementGroup.baseUrl}/l/all_user_installments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

class InstallmentdetailsCall {
  Future<ApiCallResponse> call({
    String? installmentId = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "installment_id": "${installmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'installmentdetails',
      apiUrl: '${LoanManagementGroup.baseUrl}/l/installment_details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

class PaydaydetailsbyuserpaymentCall {
  Future<ApiCallResponse> call({
    String? paymentId = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "payment_id": "${paymentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'paydaydetailsbyuserpayment',
      apiUrl: '${LoanManagementGroup.baseUrl}/l/payday_details_by_user_payment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PaymentsinarowCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'paymentsinarow',
      apiUrl: '${LoanManagementGroup.baseUrl}/cl/payments_in_a_row',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End loanManagement Group Code

/// Start KYC Group Code

class KycGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateapplicantCall createapplicantCall = CreateapplicantCall();
  static KyccreatekyclinkCall kyccreatekyclinkCall = KyccreatekyclinkCall();
}

class CreateapplicantCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "external_user_id": "${userId}",
  "level_name": "EuroGet KYC"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createapplicant',
      apiUrl: '${KycGroup.baseUrl}/kyc/create_applicant',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class KyccreatekyclinkCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "level_name": "EuroGet KYC",
  "ttl_in_secs": 600,
  "locale": "en"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'kyccreatekyclink',
      apiUrl: '${KycGroup.baseUrl}/kyc/create_kyc_link',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End KYC Group Code

/// Start creditLimits Group Code

class CreditLimitsGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static InitialcreditlimitCall initialcreditlimitCall =
      InitialcreditlimitCall();
}

class InitialcreditlimitCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'initialcreditlimit',
      apiUrl: '${CreditLimitsGroup.baseUrl}/cl/initial_credit_limit',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End creditLimits Group Code

/// Start Onboarding Group Code

class OnboardingGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ResendverificationCall resendverificationCall =
      ResendverificationCall();
}

class ResendverificationCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resendverification',
      apiUrl: '${OnboardingGroup.baseUrl}/resend-verification',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Onboarding Group Code

/// Start overdraftprotection Group Code

class OverdraftprotectionGroup {
  static String baseUrl = 'https://euroget-production.up.railway.app/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static OverdraftprotectionCall overdraftprotectionCall =
      OverdraftprotectionCall();
}

class OverdraftprotectionCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? balanceLimit,
    bool? optInStatus,
    int? desiredSum,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "desired_sum": ${desiredSum},
  "balance_limit": ${balanceLimit},
  "opt_in_status": ${optInStatus}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'overdraftprotection',
      apiUrl: '${OverdraftprotectionGroup.baseUrl}overdraft_protection',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End overdraftprotection Group Code

class CreditdecisionCall {
  static Future<ApiCallResponse> call({
    String? agreementId = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "agreement_id": "${agreementId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'creditdecision',
      apiUrl: 'https://euroget-production.up.railway.app/credit_decision',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
