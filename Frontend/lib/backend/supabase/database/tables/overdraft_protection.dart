import '../database.dart';

class OverdraftProtectionTable extends SupabaseTable<OverdraftProtectionRow> {
  @override
  String get tableName => 'overdraft_protection';

  @override
  OverdraftProtectionRow createRow(Map<String, dynamic> data) =>
      OverdraftProtectionRow(data);
}

class OverdraftProtectionRow extends SupabaseDataRow {
  OverdraftProtectionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OverdraftProtectionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get balanceLimit => getField<double>('balance_limit');
  set balanceLimit(double? value) => setField<double>('balance_limit', value);

  bool? get optInStatus => getField<bool>('opt_in_status');
  set optInStatus(bool? value) => setField<bool>('opt_in_status', value);
}
