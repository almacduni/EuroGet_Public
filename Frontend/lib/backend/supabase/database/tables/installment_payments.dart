import '../database.dart';

class InstallmentPaymentsTable extends SupabaseTable<InstallmentPaymentsRow> {
  @override
  String get tableName => 'installment_payments';

  @override
  InstallmentPaymentsRow createRow(Map<String, dynamic> data) =>
      InstallmentPaymentsRow(data);
}

class InstallmentPaymentsRow extends SupabaseDataRow {
  InstallmentPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InstallmentPaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get paymentAmount => getField<int>('payment_amount');
  set paymentAmount(int? value) => setField<int>('payment_amount', value);

  String? get instalmentId => getField<String>('instalment_id');
  set instalmentId(String? value) => setField<String>('instalment_id', value);

  bool? get isPartOfInstalment => getField<bool>('is_part_of_instalment');
  set isPartOfInstalment(bool? value) =>
      setField<bool>('is_part_of_instalment', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get chargeDate => getField<DateTime>('charge_date');
  set chargeDate(DateTime? value) => setField<DateTime>('charge_date', value);

  String? get paymentId => getField<String>('payment_id');
  set paymentId(String? value) => setField<String>('payment_id', value);

  String? get subscriptionId => getField<String>('subscription_id');
  set subscriptionId(String? value) =>
      setField<String>('subscription_id', value);

  bool? get isPartOfSubscription => getField<bool>('is_part_of_subscription');
  set isPartOfSubscription(bool? value) =>
      setField<bool>('is_part_of_subscription', value);
}
