import '../database.dart';

class AllTable extends SupabaseTable<AllRow> {
  @override
  String get tableName => 'all';

  @override
  AllRow createRow(Map<String, dynamic> data) => AllRow(data);
}

class AllRow extends SupabaseDataRow {
  AllRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AllTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
