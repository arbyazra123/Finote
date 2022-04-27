part of 'disbursment_summary_report_bloc.dart';

@freezed
class DisbursmentSummaryReportEvent with _$DisbursmentSummaryReportEvent {
  const factory DisbursmentSummaryReportEvent.changeDate(DateTime time) = _ChangeDate;
}