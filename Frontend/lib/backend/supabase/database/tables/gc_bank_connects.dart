import '../database.dart';

class GcBankConnectsTable extends SupabaseTable<GcBankConnectsRow> {
  @override
  String get tableName => 'gc_bank_connects';

  @override
  GcBankConnectsRow createRow(Map<String, dynamic> data) =>
      GcBankConnectsRow(data);
}

class GcBankConnectsRow extends SupabaseDataRow {
  GcBankConnectsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GcBankConnectsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get requisitionId => getField<String>('requisition_id');
  set requisitionId(String? value) => setField<String>('requisition_id', value);

  String? get agreementId => getField<String>('agreement_id');
  set agreementId(String? value) => setField<String>('agreement_id', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get institutionId => getField<String>('institution_id');
  set institutionId(String? value) => setField<String>('institution_id', value);

  int? get maxHistoricalDays => getField<int>('max_historical_days');
  set maxHistoricalDays(int? value) =>
      setField<int>('max_historical_days', value);

  int? get accessValidForDays => getField<int>('access_valid_for_days');
  set accessValidForDays(int? value) =>
      setField<int>('access_valid_for_days', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get accepted => getField<DateTime>('accepted');
  set accepted(DateTime? value) => setField<DateTime>('accepted', value);

  String? get bankAccounts => getField<String>('bank_accounts');
  set bankAccounts(String? value) => setField<String>('bank_accounts', value);

  String? get connectionStatus => getField<String>('connection_status');
  set connectionStatus(String? value) =>
      setField<String>('connection_status', value);
}
