part of 'disbursment_report_chart_bloc.dart';

@freezed
class DisbursmentReportChartEvent with _$DisbursmentReportChartEvent {
  const factory DisbursmentReportChartEvent.changeDate(DateTime time) = _ChangeDate;
}