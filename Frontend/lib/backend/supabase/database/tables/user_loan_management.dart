import '../database.dart';

class UserLoanManagementTable extends SupabaseTable<UserLoanManagementRow> {
  @override
  String get tableName => 'user_loan_management';

  @override
  UserLoanManagementRow createRow(Map<String, dynamic> data) =>
      UserLoanManagementRow(data);
}

class UserLoanManagementRow extends SupabaseDataRow {
  UserLoanManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLoanManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get totalLoanTaken => getField<double>('total_loan_taken');
  set totalLoanTaken(double? value) =>
      setField<double>('total_loan_taken', value);

  double? get totalLoanRepaid => getField<double>('total_loan_repaid');
  set totalLoanRepaid(double? value) =>
      setField<double>('total_loan_repaid', value);

  double? get activeLoan => getField<double>('active_loan');
  set activeLoan(double? value) => setField<double>('active_loan', value);

  bool? get approved => getField<bool>('approved');
  set approved(bool? value) => setField<bool>('approved', value);

  String? get initialCreditDecision =>
      getField<String>('initial_credit_decision');
  set initialCreditDecision(String? value) =>
      setField<String>('initial_credit_decision', value);

  int? get paymentsInTheRaw => getField<int>('payments_in_the_raw');
  set paymentsInTheRaw(int? value) =>
      setField<int>('payments_in_the_raw', value);

  int? get missedPayments => getField<int>('missed_payments');
  set missedPayments(int? value) => setField<int>('missed_payments', value);

  int? get currentLimit => getField<int>('current_limit');
  set currentLimit(int? value) => setField<int>('current_limit', value);

  int? get activeLoansCount => getField<int>('active_loans_count');
  set activeLoansCount(int? value) =>
      setField<int>('active_loans_count', value);
}
