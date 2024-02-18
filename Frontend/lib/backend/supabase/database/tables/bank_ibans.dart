import '../database.dart';

class BankIbansTable extends SupabaseTable<BankIbansRow> {
  @override
  String get tableName => 'bank_ibans';

  @override
  BankIbansRow createRow(Map<String, dynamic> data) => BankIbansRow(data);
}

class BankIbansRow extends SupabaseDataRow {
  BankIbansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BankIbansTable();

  String? get iban => getField<String>('iban');
  set iban(String? value) => setField<String>('iban', value);

  String? get ownerName => getField<String>('owner_name');
  set ownerName(String? value) => setField<String>('owner_name', value);

  String? get accountId => getField<String>('account_id');
  set accountId(String? value) => setField<String>('account_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get institutionId => getField<String>('institution_id');
  set institutionId(String? value) => setField<String>('institution_id', value);

  DateTime? get accountCreated => getField<DateTime>('account_created');
  set accountCreated(DateTime? value) =>
      setField<DateTime>('account_created', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get connectionStatus => getField<String>('connection_status');
  set connectionStatus(String? value) =>
      setField<String>('connection_status', value);

  String? get bankLogo => getField<String>('bank_logo');
  set bankLogo(String? value) => setField<String>('bank_logo', value);

  String? get bankName => getField<String>('bank_name');
  set bankName(String? value) => setField<String>('bank_name', value);
}
