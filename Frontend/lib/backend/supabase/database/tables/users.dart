import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get membershipActive => getField<bool>('membership_active');
  set membershipActive(bool? value) =>
      setField<bool>('membership_active', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);
}
