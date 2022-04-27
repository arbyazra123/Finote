import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'disbursment_report_chart_event.dart';
part 'disbursment_report_chart_state.dart';
part 'disbursment_report_chart_bloc.freezed.dart';

@injectable
class DisbursmentReportChartBloc extends Bloc<DisbursmentReportChartEvent, DisbursmentReportChartState> {
  DisbursmentReportChartBloc() : super(DisbursmentReportChartState.initial()) {
    on<_ChangeDate>((event, emit) {
      emit(state.copyWith(time: event.time));
    });
  }
}
