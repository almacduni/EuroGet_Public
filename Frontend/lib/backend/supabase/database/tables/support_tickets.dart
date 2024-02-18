import '../database.dart';

class SupportTicketsTable extends SupabaseTable<SupportTicketsRow> {
  @override
  String get tableName => 'support_tickets';

  @override
  SupportTicketsRow createRow(Map<String, dynamic> data) =>
      SupportTicketsRow(data);
}

class SupportTicketsRow extends SupabaseDataRow {
  SupportTicketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportTicketsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get inquiry => getField<String>('inquiry');
  set inquiry(String? value) => setField<String>('inquiry', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
