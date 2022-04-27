part of 'disbursment_report_chart_bloc.dart';

@freezed
class DisbursmentReportChartState with _$DisbursmentReportChartState {
  const factory DisbursmentReportChartState({
    required DateTime time,
  }) = _DisbursmentReportChartState;

  factory DisbursmentReportChartState.initial() => DisbursmentReportChartState(time: DateTime.now());
}
