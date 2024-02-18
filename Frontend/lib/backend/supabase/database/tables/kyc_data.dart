import '../database.dart';

class KycDataTable extends SupabaseTable<KycDataRow> {
  @override
  String get tableName => 'kyc_data';

  @override
  KycDataRow createRow(Map<String, dynamic> data) => KycDataRow(data);
}

class KycDataRow extends SupabaseDataRow {
  KycDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KycDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get sumsubId => getField<String>('sumsub_id');
  set sumsubId(String? value) => setField<String>('sumsub_id', value);

  String? get reviewAnswer => getField<String>('review_answer');
  set reviewAnswer(String? value) => setField<String>('review_answer', value);

  String? get rejectLabels => getField<String>('reject_labels');
  set rejectLabels(String? value) => setField<String>('reject_labels', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
