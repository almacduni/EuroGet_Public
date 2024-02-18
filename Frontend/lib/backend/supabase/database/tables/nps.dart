import '../database.dart';

class NpsTable extends SupabaseTable<NpsRow> {
  @override
  String get tableName => 'nps';

  @override
  NpsRow createRow(Map<String, dynamic> data) => NpsRow(data);
}

class NpsRow extends SupabaseDataRow {
  NpsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NpsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get nps => getField<int>('nps');
  set nps(int? value) => setField<int>('nps', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
