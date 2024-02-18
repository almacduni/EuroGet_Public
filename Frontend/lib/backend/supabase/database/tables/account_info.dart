import '../database.dart';

class AccountInfoTable extends SupabaseTable<AccountInfoRow> {
  @override
  String get tableName => 'account_info';

  @override
  AccountInfoRow createRow(Map<String, dynamic> data) => AccountInfoRow(data);
}

class AccountInfoRow extends SupabaseDataRow {
  AccountInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AccountInfoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  String? get taxId => getField<String>('tax_id');
  set taxId(String? value) => setField<String>('tax_id', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get zipCode => getField<String>('zip_code');
  set zipCode(String? value) => setField<String>('zip_code', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);
}
