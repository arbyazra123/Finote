import 'package:finote/application/disbursment_report_chart/disbursment_report_chart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../../../application/user_necessity/user_necessity_bloc.dart';
import '../../../shared/utility/custom_datetime_picker.dart';
import '../../report/widgets/calculation_result.dart';

class ChartReport extends StatelessWidget {
  const ChartReport({
    Key? key,
    required this.userNecessityState,
  }) : super(key: key);

  final UserNecessityState userNecessityState;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DisbursmentReportChartBloc, DisbursmentReportChartState,
        DateTime>(
      selector: (state) => state.time,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Text(
                      "Grafik Pengeluaran",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Lato",
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        await DatePicker.showPicker(context,
                            pickerModel: CustomMonthPicker(
                              currentTime: state,
                              minTime: DateTime(DateTime.now().year - 1, 5),
                              maxTime: DateTime(DateTime.now().year + 1, 12),
                              locale: LocaleType.id,
                            )).then((date) {
                          if (date != null) {
                            context.read<DisbursmentReportChartBloc>().add(
                                DisbursmentReportChartEvent.changeDate(date));
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            DateFormat("MMM yyyy").format(
                              state,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Lato",
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.chevron_left,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width > 850 ? 15 : 0,
              ),
              Builder(builder: (context) {
                if (MediaQuery.of(context).size.width > 850) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 500,
                      // width: double.maxFinite,
                      child: CalculationResult(
                          userNecessityState: userNecessityState),
                    ),
                  );
                }
                return SizedBox(
                  height: 300,
                  child:
                      CalculationResult(userNecessityState: userNecessityState),
                );
              }),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
