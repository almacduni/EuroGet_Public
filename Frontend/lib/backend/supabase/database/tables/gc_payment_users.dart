import '../database.dart';

class GcPaymentUsersTable extends SupabaseTable<GcPaymentUsersRow> {
  @override
  String get tableName => 'gc_payment_users';

  @override
  GcPaymentUsersRow createRow(Map<String, dynamic> data) =>
      GcPaymentUsersRow(data);
}

class GcPaymentUsersRow extends SupabaseDataRow {
  GcPaymentUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GcPaymentUsersTable();

  String get pCustomerId => getField<String>('p_customer_id')!;
  set pCustomerId(String value) => setField<String>('p_customer_id', value);

  String? get pBankAccountId => getField<String>('p_bank_account_id');
  set pBankAccountId(String? value) =>
      setField<String>('p_bank_account_id', value);

  String? get pMandateId => getField<String>('p_mandate_id');
  set pMandateId(String? value) => setField<String>('p_mandate_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get iban => getField<String>('iban');
  set iban(String? value) => setField<String>('iban', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get mandateStatus => getField<String>('mandate_status');
  set mandateStatus(String? value) => setField<String>('mandate_status', value);
}
