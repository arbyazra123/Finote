import 'package:finote/application/disbursmenet_summary_report/disbursment_summary_report_bloc.dart';
import 'package:finote/shared/utility/custom_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../../application/user_necessity/user_necessity_bloc.dart';
import '../../../infrastructure/user_necessity/models/user_necessity.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key, required this.userNecessityState}) : super(key: key);
  final UserNecessityState userNecessityState;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<DisbursmentSummaryReportBloc,
        DisbursmentSummaryReportState, DateTime>(
      selector: (state) => state.time,
      builder: (context, state) {
        var data = summarizing(state);
        return Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: 16,
          // ),
          padding: EdgeInsets.symmetric(vertical: 12),
          color: Colors.white,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   boxShadow: [
          //     BoxShadow(
          //         color: Colors.black.withOpacity(0.1),
          //         blurRadius: 3,
          //         spreadRadius: 1)
          //   ],
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text(
                        "Ringkasan Pengeluaran",
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
                              context.read<DisbursmentSummaryReportBloc>().add(
                                  DisbursmentSummaryReportEvent.changeDate(
                                      date));
                            }
                          });
                          // showMonthPicker(
                          //   context: context,
                          //   firstDate: DateTime(DateTime.now().year - 1, 5),
                          //   lastDate: DateTime(DateTime.now().year + 1, 12),
                          //   initialDate: state,
                          // ).then((date) {
                          //   context.read<DisbursmentSummaryReportBloc>().add(
                          //       DisbursmentSummaryReportEvent.changeDate(date));
                          //   context.read<DisbursmentSummaryReportBloc>().add(
                          //       DisbursmentSummaryReportEvent.changeDate(date));
                          // });
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
              ),
              Divider(
                height: 25,
              ),
              Visibility(
                visible: data.keys.isNotEmpty,
                replacement: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text("Tidak ada data"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _buildSummaryItem(
                            data.keys.elementAt(index), data);
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: data.keys.length,
                    ),
                    Divider(
                      height: 25,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 26),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            NumberFormat.currency(
                                    symbol: "Rp", decimalDigits: 0)
                                .format(
                              userNecessityState.userNecessity.necessity?.fold(
                                0.0,
                                (double? previousValue, element) =>
                                    (previousValue ?? 0) +
                                    (element.amount ?? 0),
                              ),
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  Map<String, List<Necessity>> summarizing(DateTime time) {
    Map<String, List<Necessity>> necessitiesByName = {};
    userNecessityState.userNecessity.necessity?.forEach((element) {
      var date = DateTime.parse(element.datetime ?? DateTime.now().toString());
      if (DateTime(date.year, date.month)
          .isAtSameMomentAs(DateTime(time.year, time.month))) {
        if (!necessitiesByName.containsKey(element.name)) {
          necessitiesByName[element.name ?? ""] = [element];
        } else {
          necessitiesByName[element.name]?.add(element);
        }
      }
    });
    return necessitiesByName;
    // return necessitiesByName.keys
    //     .map(
    //       (e) => _buildSummaryItem(e, necessitiesByName),
    //     )
    //     .toList();
  }

  Widget _buildSummaryItem(
      String e, Map<String, List<Necessity>> necessitiesByName) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 18, right: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "(${NumberFormat.currency(symbol: "Rp", decimalDigits: 0).format(necessitiesByName[e]?.first.amount ?? "")}) x ${necessitiesByName[e]?.length.toString() ?? ""} item",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            NumberFormat.currency(symbol: "Rp", decimalDigits: 0).format(
              _getTotalByNames(necessitiesByName, e),
            ),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  double? _getTotalByNames(
          Map<String, List<Necessity>> necessitiesByName, String e) =>
      necessitiesByName[e]?.fold(
          0.0,
          (double? previousValue, element) =>
              (previousValue ?? 0) + (element.amount ?? 0));
}
