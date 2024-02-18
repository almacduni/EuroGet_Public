import '../database.dart';

class MlObDatasetTable extends SupabaseTable<MlObDatasetRow> {
  @override
  String get tableName => 'ml_ob_dataset';

  @override
  MlObDatasetRow createRow(Map<String, dynamic> data) => MlObDatasetRow(data);
}

class MlObDatasetRow extends SupabaseDataRow {
  MlObDatasetRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MlObDatasetTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  dynamic? get rawTransactions => getField<dynamic>('raw_transactions');
  set rawTransactions(dynamic? value) =>
      setField<dynamic>('raw_transactions', value);

  String? get gcAccountId => getField<String>('gc_account_id');
  set gcAccountId(String? value) => setField<String>('gc_account_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get agreementId => getField<String>('agreement_id');
  set agreementId(String? value) => setField<String>('agreement_id', value);
}
