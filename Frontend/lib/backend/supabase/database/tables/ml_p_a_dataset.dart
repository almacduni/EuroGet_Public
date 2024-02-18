import '../database.dart';

class MlPADatasetTable extends SupabaseTable<MlPADatasetRow> {
  @override
  String get tableName => 'ml_p_a_dataset';

  @override
  MlPADatasetRow createRow(Map<String, dynamic> data) => MlPADatasetRow(data);
}

class MlPADatasetRow extends SupabaseDataRow {
  MlPADatasetRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MlPADatasetTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double? get totalBorrowed => getField<double>('total_borrowed');
  set totalBorrowed(double? value) => setField<double>('total_borrowed', value);

  double? get totalPaid => getField<double>('total_paid');
  set totalPaid(double? value) => setField<double>('total_paid', value);

  int? get paymentsInTheRaw => getField<int>('payments_in_the_raw');
  set paymentsInTheRaw(int? value) =>
      setField<int>('payments_in_the_raw', value);
}
