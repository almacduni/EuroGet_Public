import '../database.dart';

class OutPaymentsTable extends SupabaseTable<OutPaymentsRow> {
  @override
  String get tableName => 'out_payments';

  @override
  OutPaymentsRow createRow(Map<String, dynamic> data) => OutPaymentsRow(data);
}

class OutPaymentsRow extends SupabaseDataRow {
  OutPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OutPaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
