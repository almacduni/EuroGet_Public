import '../database.dart';

class MembershipsTable extends SupabaseTable<MembershipsRow> {
  @override
  String get tableName => 'memberships';

  @override
  MembershipsRow createRow(Map<String, dynamic> data) => MembershipsRow(data);
}

class MembershipsRow extends SupabaseDataRow {
  MembershipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MembershipsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  bool? get isMember => getField<bool>('is_member');
  set isMember(bool? value) => setField<bool>('is_member', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  bool? get cancelled => getField<bool>('cancelled');
  set cancelled(bool? value) => setField<bool>('cancelled', value);

  String? get subscriptionId => getField<String>('subscription_id');
  set subscriptionId(String? value) =>
      setField<String>('subscription_id', value);

  String? get plan => getField<String>('plan');
  set plan(String? value) => setField<String>('plan', value);
}
