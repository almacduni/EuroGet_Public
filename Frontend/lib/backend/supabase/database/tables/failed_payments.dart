import '../database.dart';

class FailedPaymentsTable extends SupabaseTable<FailedPaymentsRow> {
  @override
  String get tableName => 'failed_payments';

  @override
  FailedPaymentsRow createRow(Map<String, dynamic> data) =>
      FailedPaymentsRow(data);
}

class FailedPaymentsRow extends SupabaseDataRow {
  FailedPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FailedPaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get paymentId => getField<String>('payment_id');
  set paymentId(String? value) => setField<String>('payment_id', value);

  String? get cause => getField<String>('cause');
  set cause(String? value) => setField<String>('cause', value);

  bool? get isPartOfInstalment => getField<bool>('is_part_of_instalment');
  set isPartOfInstalment(bool? value) =>
      setField<bool>('is_part_of_instalment', value);

  String? get instalmentId => getField<String>('instalment_id');
  set instalmentId(String? value) => setField<String>('instalment_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
