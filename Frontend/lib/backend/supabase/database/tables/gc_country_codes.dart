import '../database.dart';

class GcCountryCodesTable extends SupabaseTable<GcCountryCodesRow> {
  @override
  String get tableName => 'gc_country_codes';

  @override
  GcCountryCodesRow createRow(Map<String, dynamic> data) =>
      GcCountryCodesRow(data);
}

class GcCountryCodesRow extends SupabaseDataRow {
  GcCountryCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GcCountryCodesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get logo => getField<String>('logo');
  set logo(String? value) => setField<String>('logo', value);
}
