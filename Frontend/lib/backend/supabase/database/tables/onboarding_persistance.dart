import '../database.dart';

class OnboardingPersistanceTable
    extends SupabaseTable<OnboardingPersistanceRow> {
  @override
  String get tableName => 'onboarding_persistance';

  @override
  OnboardingPersistanceRow createRow(Map<String, dynamic> data) =>
      OnboardingPersistanceRow(data);
}

class OnboardingPersistanceRow extends SupabaseDataRow {
  OnboardingPersistanceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OnboardingPersistanceTable();

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get step => getField<int>('step');
  set step(int? value) => setField<int>('step', value);

  String? get pageRoute => getField<String>('pageRoute');
  set pageRoute(String? value) => setField<String>('pageRoute', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
