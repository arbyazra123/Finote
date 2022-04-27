part of 'disbursment_summary_report_bloc.dart';

@freezed
class DisbursmentSummaryReportState with _$DisbursmentSummaryReportState {
  const factory DisbursmentSummaryReportState({
    required DateTime time,
  }) = _DisbursmentSummaryReportState;

  factory DisbursmentSummaryReportState.initial()=>DisbursmentSummaryReportState(time: DateTime.now());
}
