import '../database.dart';

class IssuedLoansTable extends SupabaseTable<IssuedLoansRow> {
  @override
  String get tableName => 'issued_loans';

  @override
  IssuedLoansRow createRow(Map<String, dynamic> data) => IssuedLoansRow(data);
}

class IssuedLoansRow extends SupabaseDataRow {
  IssuedLoansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IssuedLoansTable();

  String get loanId => getField<String>('loan_id')!;
  set loanId(String value) => setField<String>('loan_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get sum => getField<double>('sum');
  set sum(double? value) => setField<double>('sum', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  bool? get isPaid => getField<bool>('is_paid');
  set isPaid(bool? value) => setField<bool>('is_paid', value);

  String? get instalmentId => getField<String>('instalment_id');
  set instalmentId(String? value) => setField<String>('instalment_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double? get commission => getField<double>('commission');
  set commission(double? value) => setField<double>('commission', value);

  double? get totalSum => getField<double>('total_sum');
  set totalSum(double? value) => setField<double>('total_sum', value);

  String? get paymentId => getField<String>('payment_id');
  set paymentId(String? value) => setField<String>('payment_id', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
