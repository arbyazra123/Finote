import 'package:charts_flutter/flutter.dart' as charts;
import 'package:finote/infrastructure/user_necessity/models/user_necessity.dart';
import 'package:finote/presentation/report/widgets/stack_chart.dart';
import 'package:finote/shared/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../application/disbursment_report_chart/disbursment_report_chart_bloc.dart';
import '../../../application/user_necessity/user_necessity_bloc.dart';
import 'necessity_day_dialog.dart';

class CalculationResult extends StatelessWidget {
  const CalculationResult({Key? key, required this.userNecessityState})
      : super(key: key);
  final UserNecessityState userNecessityState;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DisbursmentReportChartBloc, DisbursmentReportChartState,
        DateTime>(
      selector: (state) => state.time,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: SfCartesianChart(
            onSelectionChanged: (selectionArgs) =>
                print(selectionArgs.seriesIndex),

            primaryXAxis: DateTimeAxis(
              // rangeController: ,
              dateFormat: DateFormat("MMM dd"),
              labelRotation: 90,
              intervalType: DateTimeIntervalType.days,
              //  interval: 1.0,
              zoomFactor: 1,
              interval: 1.5,
              autoScrollingDeltaType: DateTimeIntervalType.days,
              enableAutoIntervalOnZooming: false,
              minimum: DateTime(state.year, state.month, 1),
              maximum: DateTime(state.year, state.month,
                  DateTime(state.year, state.month + 1, 0).day),
              //  enableAutoIntervalOnZooming: true,
              majorGridLines: MajorGridLines(width: 1),
              // intervalType: DateTimeIntervalType.days,
              axisLabelFormatter: (axisLabelRenderArgs) => ChartAxisLabel(
                "${axisLabelRenderArgs.text}",
                TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            zoomPanBehavior: ZoomPanBehavior(
              // maximumZoomLevel: 0.1,
              selectionRectBorderColor: Colors.blue,
              enableMouseWheelZooming: true,

              enablePanning: true,
              enablePinching: true,

              zoomMode: ZoomMode.x,
            ),

            primaryYAxis: NumericAxis(
                axisLine: const AxisLine(width: 0),
                axisLabelFormatter: (v) => ChartAxisLabel(
                    NumberFormat.compactCurrency(name: "").format(v.value),
                    TextStyle(fontWeight: FontWeight.w300)),
                majorTickLines: const MajorTickLines(size: 0)),
            // Chart title
            // title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend

            legend: Legend(
              isVisible: true,
              alignment: ChartAlignment.near,
              position: LegendPosition.top,
            ),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: g2(
              context,
              userNecessityState.userNecessity,
              state,
            ),
          ),
        );
      },
    );
  }

  List<charts.Series<OrdinalCalculation, String>> g(
      UserNecessity needs, DateTime time) {
    var daysOfMonth = DateTime(time.year, time.month + 1, 0).day;
    var daily = <OrdinalCalculation>[];
    var unexpected = <OrdinalCalculation>[];
    var monthly = <OrdinalCalculation>[];
    var weekly = <OrdinalCalculation>[];
    var emergency = <OrdinalCalculation>[];
    if (needs.necessity != null) {
      for (var e in needs.necessity!) {
        if (e.disbursementIntervalType == "Harian") {
          daily.addAll(List<OrdinalCalculation>.generate(daysOfMonth,
              (index) => OrdinalCalculation(day: index + 1, need: e)));
        } else if (e.disbursementIntervalType == "Mingguan") {
          getIt<Logger>().d("daysOfMonth ~/ 4 ${daysOfMonth ~/ 7}");
          weekly.addAll(List<OrdinalCalculation>.generate((daysOfMonth ~/ 7),
              (index) => OrdinalCalculation(day: (index + 1) * 7, need: e)));
        } else if (e.disbursementIntervalType == "Bulanan") {
          monthly.addAll(List<OrdinalCalculation>.generate(
              1, (index) => OrdinalCalculation(day: 1, need: e)));
        } else if (e.disbursementIntervalType == "Tidak tentu") {
          unexpected.add(OrdinalCalculation(
              day: DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
              need: e));
        } else if (e.disbursementIntervalType == "Darurat") {
          emergency.add(OrdinalCalculation(
              day: DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
              need: e));
        }
      }
    }
    // if (daily.isEmpty) {
    //   daily.addAll(List<OrdinalCalculation>.generate(
    //       daysOfMonth,
    //       (index) =>
    //           OrdinalCalculation(day: index + 1, need: Necessity(amount: 0))));
    // }
    return [
      charts.Series<OrdinalCalculation, String>(
        id: 'Harian',
        domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
        measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        data: daily
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      charts.Series<OrdinalCalculation, String>(
        id: 'Mingguan',
        domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
        measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: weekly
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      charts.Series<OrdinalCalculation, String>(
        id: 'Bulanan',
        domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
        measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        data: monthly
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      charts.Series<OrdinalCalculation, String>(
        id: 'Tidak Tentu',
        domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
        measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        data: unexpected
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      charts.Series<OrdinalCalculation, String>(
        id: 'Darurat',
        domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
        measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        data: emergency
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
    ];
    // return [
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Daily',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
    //     data: daily
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Weekly',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.green.shadeDefault,
    //     data: weekly
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Monthly',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.purple.shadeDefault,
    //     data: monthly
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Tidak Tentu',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.deepOrange.shadeDefault,
    //     data: unexpected
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Darurat',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.red.shadeDefault,
    //     data: emergency
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    // ];
  }

  List<StackedColumnSeries<OrdinalCalculation, DateTime>> g2(
      BuildContext context, UserNecessity needs, DateTime time) {
    var daysOfMonth = DateTime(time.year, time.month + 1, 0).day;
    var daily = <OrdinalCalculation>[];
    var unexpected = <OrdinalCalculation>[];
    var monthly = <OrdinalCalculation>[];
    var weekly = <OrdinalCalculation>[];
    var emergency = <OrdinalCalculation>[];

    if (needs.necessity != null) {
      var nullableVar = Necessity(
        amount: 0,
      );
      for (var e in needs.necessity!) {
        var date = DateTime.parse(e.datetime ?? DateTime.now().toString());
        if (DateTime(date.year, date.month)
            .isAtSameMomentAs(DateTime(time.year, time.month))) {
          if (e.disbursementIntervalType == "Harian") {
            daily.addAll(List<OrdinalCalculation>.generate(daysOfMonth,
                (index) => OrdinalCalculation(day: index + 1, need: e)));
          } else if (e.disbursementIntervalType == "Mingguan") {
            weekly.addAll(
              List<OrdinalCalculation>.generate(
                (daysOfMonth),
                (index) => OrdinalCalculation(
                  day: index + 1,
                  need: (index + 1) % 7 == 0 ? e : nullableVar,
                ),
              ),
            );
          } else if (e.disbursementIntervalType == "Bulanan") {
            monthly.addAll(List<OrdinalCalculation>.generate(
                daysOfMonth,
                (index) => OrdinalCalculation(
                      day: index + 1,
                      need: index == 0 ? e : nullableVar,
                    )));
          } else if (e.disbursementIntervalType == "Tidak tentu") {
            unexpected.add(OrdinalCalculation(
                day:
                    DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
                need: e));
            // unexpected
            //     .addAll(List<OrdinalCalculation>.generate(daysOfMonth, (index) {
            //   var d =
            //       DateTime.parse(e.datetime ?? DateTime.now().toString()).day;
            //   return OrdinalCalculation(
            //       day: d, need: (index + 1) == d ? e : nullableVar);
            // }));
          } else if (e.disbursementIntervalType == "Darurat") {
            emergency
                .addAll(List<OrdinalCalculation>.generate(daysOfMonth, (index) {
              var d =
                  DateTime.parse(e.datetime ?? DateTime.now().toString()).day;
              return OrdinalCalculation(
                  day: d, need: (index + 1) == d ? e : nullableVar);
            }));
          }
        }
      }
    }
    return [
      StackedColumnSeries<OrdinalCalculation, DateTime>(
        name: "Harian",
        xValueMapper: (OrdinalCalculation sales, _) {
          return DateTime(time.year, time.month, sales.day);
        },
        onPointTap: (v) {
          print("Harian ${((v.pointIndex ?? 0) + 1)}");
          showDayOfNecessity(
              context,
              DateTime(time.year, time.month, (v.pointIndex ?? 0) + 1),
              userNecessityState);
        },
        yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
        color: Colors.blue,
        dataSource: daily
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      StackedColumnSeries<OrdinalCalculation, DateTime>(
        name: "Mingguan",
        onPointTap: (v) {
          print("Mingguan ${((v.pointIndex ?? 0) + 1)}");
          showDayOfNecessity(
              context,
              DateTime(time.year, time.month,
                  v.dataPoints?[v.pointIndex ?? 0].x.day),
              userNecessityState);
        },
        xValueMapper: (OrdinalCalculation sales, _) {
          // if ((sales.day) % 7 != 0) return null;
          return DateTime(time.year, time.month, sales.day);
        },
        yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
        color: Colors.green,
        dataSource: weekly.map((e) {
          return OrdinalCalculation(need: e.need, day: e.day);
        }).toList(),
      ),
      StackedColumnSeries<OrdinalCalculation, DateTime>(
        name: "Bulanan",
        onPointTap: (v) {
          print("Bulanan ${((v.pointIndex ?? 0) + 1)}");
          showDayOfNecessity(
              context,
              DateTime(time.year, time.month, (v.pointIndex ?? 0) + 1),
              userNecessityState);
        },
        xValueMapper: (OrdinalCalculation sales, _) {
          return DateTime(time.year, time.month, 1);
        },
        yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
        color: Colors.purple,
        dataSource: monthly
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      StackedColumnSeries<OrdinalCalculation, DateTime>(
        name: "Tidak Tentu",
        onPointTap: (v) {
          print(
              "v.dataPoints?.map((e) => e.toString()) ${v.dataPoints?.map((e) => e.x.toString())}");
          print("Tidak Tentu ${((v.seriesIndex ?? 0) + 1)}");
          showDayOfNecessity(
              context,
              DateTime(time.year, time.month, (v.pointIndex ?? 0) + 1),
              userNecessityState);
        },
        xValueMapper: (OrdinalCalculation sales, _) =>
            DateTime(time.year, time.month, sales.day),
        yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
        // yValueMapper: (OrdinalCalculation sales, _) {
        //   var total = unexpected.where((element) => sales.need.disbursementIntervalType == element.need.disbursementIntervalType && element.day==sales.day).fold(
        //       0.0,
        //       (double? previousValue, element) =>
        //           (previousValue ?? 0) + (element.need.amount ?? 0));
        //   return total;
        // },
        color: Colors.deepOrange,
        dataSource: unexpected
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
      StackedColumnSeries<OrdinalCalculation, DateTime>(
        name: "Darurat",
        onPointTap: (v) {
          print("Darurat ${((v.pointIndex ?? 0) + 1)}");
          showDayOfNecessity(
              context,
              DateTime(time.year, time.month, (v.pointIndex ?? 0) + 1),
              userNecessityState);
        },
        xValueMapper: (OrdinalCalculation sales, _) =>
            DateTime(time.year, time.month, sales.day),
        yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
        color: Colors.red,
        dataSource: emergency
            .map((e) => OrdinalCalculation(need: e.need, day: e.day))
            .toList(),
      ),
    ];
    // return [
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Daily',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
    //     data: daily
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Weekly',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.green.shadeDefault,
    //     data: weekly
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Monthly',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.purple.shadeDefault,
    //     data: monthly
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Tidak Tentu',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.deepOrange.shadeDefault,
    //     data: unexpected
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    //   Series<OrdinalCalculation, DateTime>(
    //     id: 'Darurat',
    //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
    //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
    //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
    //     colorFn: (_, __) => MaterialPalette.red.shadeDefault,
    //     data: emergency
    //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
    //         .toList(),
    //   ),
    // ];
  }

  Future<dynamic> showDayOfNecessity(
      BuildContext context, DateTime date, UserNecessityState state) {
    return showModalBottomSheet(
      context: context,
      builder: (c) => NecessityDayDialog(
        date: date,
        state: state,
      ),
    );
  }
}

class OrdinalCalculation {
  final int day;
  final Necessity need;

  OrdinalCalculation({required this.day, required this.need});
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
