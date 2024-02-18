import '../database.dart';

class OneOffInstallmentPaymentsTable
    extends SupabaseTable<OneOffInstallmentPaymentsRow> {
  @override
  String get tableName => 'one_off_installment_payments';

  @override
  OneOffInstallmentPaymentsRow createRow(Map<String, dynamic> data) =>
      OneOffInstallmentPaymentsRow(data);
}

class OneOffInstallmentPaymentsRow extends SupabaseDataRow {
  OneOffInstallmentPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OneOffInstallmentPaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get instalmentIds => getField<String>('instalment_ids');
  set instalmentIds(String? value) => setField<String>('instalment_ids', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get paymentId => getField<String>('payment_id');
  set paymentId(String? value) => setField<String>('payment_id', value);

  DateTime? get chargeDate => getField<DateTime>('charge_date');
  set chargeDate(DateTime? value) => setField<DateTime>('charge_date', value);
}
