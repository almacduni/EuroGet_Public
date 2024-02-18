import '../database.dart';

class TokensTable extends SupabaseTable<TokensRow> {
  @override
  String get tableName => 'tokens';

  @override
  TokensRow createRow(Map<String, dynamic> data) => TokensRow(data);
}

class TokensRow extends SupabaseDataRow {
  TokensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TokensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get gcObAccessToken => getField<String>('gc_ob_access_token');
  set gcObAccessToken(String? value) =>
      setField<String>('gc_ob_access_token', value);

  String? get gcObRefreshToken => getField<String>('gc_ob_refresh_token');
  set gcObRefreshToken(String? value) =>
      setField<String>('gc_ob_refresh_token', value);
}
