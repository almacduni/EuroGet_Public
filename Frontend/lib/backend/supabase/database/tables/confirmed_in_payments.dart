import '../database.dart';

class ConfirmedInPaymentsTable extends SupabaseTable<ConfirmedInPaymentsRow> {
  @override
  String get tableName => 'confirmed_in_payments';

  @override
  ConfirmedInPaymentsRow createRow(Map<String, dynamic> data) =>
      ConfirmedInPaymentsRow(data);
}

class ConfirmedInPaymentsRow extends SupabaseDataRow {
  ConfirmedInPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConfirmedInPaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get paymentId => getField<String>('payment_id');
  set paymentId(String? value) => setField<String>('payment_id', value);

  String? get instalmentId => getField<String>('instalment_id');
  set instalmentId(String? value) => setField<String>('instalment_id', value);

  bool? get isPartOfInstalment => getField<bool>('is_part_of_instalment');
  set isPartOfInstalment(bool? value) =>
      setField<bool>('is_part_of_instalment', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
