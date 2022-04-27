import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'disbursment_summary_report_event.dart';
part 'disbursment_summary_report_state.dart';
part 'disbursment_summary_report_bloc.freezed.dart';
@injectable
class DisbursmentSummaryReportBloc
    extends Bloc<DisbursmentSummaryReportEvent, DisbursmentSummaryReportState> {
  DisbursmentSummaryReportBloc()
      : super(DisbursmentSummaryReportState.initial()) {
    on<_ChangeDate>((event, emit) {
      emit(state.copyWith(time: event.time));
    });
  }
}
