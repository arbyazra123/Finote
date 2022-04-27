// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:finote/infrastructure/user_necessity/models/user_necessity.dart';
// import 'package:finote/presentation/report/widgets/stack_chart.dart';
// import 'package:finote/shared/injector.dart';
// import 'package:finote/shared/utility/main_utility.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import '../../../application/user_necessity/user_necessity_bloc.dart';

// class CalculationResult extends StatelessWidget {
//   CalculationResult({Key? key, required this.userNecessityState})
//       : super(key: key);
//   final UserNecessityState userNecessityState;

//   final smallDataList = [
//     DateTimeRange(
//       start: DateTime(2021, 2, 24, 23, 15),
//       end: DateTime(2021, 2, 25, 7, 30),
//     ),
//     DateTimeRange(
//       start: DateTime(2021, 2, 22, 1, 55),
//       end: DateTime(2021, 2, 22, 9, 12),
//     ),
//     DateTimeRange(
//       start: DateTime(2021, 2, 20, 0, 25),
//       end: DateTime(2021, 2, 20, 7, 34),
//     ),
//     DateTimeRange(
//       start: DateTime(2021, 2, 17, 21, 23),
//       end: DateTime(2021, 2, 18, 4, 52),
//     ),
//     DateTimeRange(
//       start: DateTime(2021, 2, 13, 6, 32),
//       end: DateTime(2021, 2, 13, 13, 12),
//     ),
//     DateTimeRange(
//       start: DateTime(2021, 2, 1, 9, 32),
//       end: DateTime(2021, 2, 1, 15, 22),
//     ),
//     DateTimeRange(
//       start: DateTime(2021, 1, 22, 12, 10),
//       end: DateTime(2021, 1, 22, 16, 20),
//     ),
//   ];

//   List<_SalesData> data = [
//     _SalesData('Jan', 35),
//     _SalesData('Feb', 28),
//     _SalesData('Mar', 34),
//     _SalesData('Apr', 32),
//     _SalesData('May', 40)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10.0),
//       child: Column(
//         children: [
//           // SizedBox(
//           //   height: 300,
//           //   child: StackedBarChart(
//           //     g(userNecessityState.userNecessity),
//           //     userNecessityState,
//           //   ),
//           // ),
//           SizedBox(
//             height: 300,
//             child: SfCartesianChart(
              
//                 onSelectionChanged: (selectionArgs) =>
//                     print(selectionArgs.seriesIndex),
//                 primaryXAxis: CategoryAxis(
                  
//                   interval: 1.0,
//                   axisLabelFormatter: (axisLabelRenderArgs) => ChartAxisLabel(
//                     "${axisLabelRenderArgs.text}",
//                     TextStyle(
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//                 ),
//                 zoomPanBehavior: ZoomPanBehavior(
//                     maximumZoomLevel: 0.4,
//                     enablePanning: true,
//                     enablePinching: true,
//                     zoomMode: ZoomMode.x),
//                 primaryYAxis: NumericAxis(
//                   // axisLine: const AxisLine(width: 0),
//                   axisLabelFormatter: (v) => ChartAxisLabel(
//                       NumberFormat.compactSimpleCurrency().format(v.value),
//                       TextStyle(fontWeight: FontWeight.w300)),
//                   // majorTickLines: const MajorTickLines(size: 0),
//                 ),
//                 // Chart title
//                 // title: ChartTitle(text: 'Half yearly sales analysis'),
//                 // Enable legend
//                 legend: Legend(
//                     isVisible: true,
//                     alignment: ChartAlignment.center,
//                     position: LegendPosition.top),
//                 // Enable tooltip
//                 tooltipBehavior: TooltipBehavior(enable: true),
//                 series: g2(userNecessityState.userNecessity)),
//           )
//         ],
//       ),
//     );
//   }

//   List<charts.Series<OrdinalCalculation, String>> g(UserNecessity needs) {
//     var daysOfMonth =
//         DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
//     var daily = <OrdinalCalculation>[];
//     var unexpected = <OrdinalCalculation>[];
//     var monthly = <OrdinalCalculation>[];
//     var weekly = <OrdinalCalculation>[];
//     var emergency = <OrdinalCalculation>[];
//     if (needs.necessity != null) {
//       for (var e in needs.necessity!) {
//         if (e.disbursementIntervalType == "Harian") {
//           daily.addAll(List<OrdinalCalculation>.generate(daysOfMonth,
//               (index) => OrdinalCalculation(day: index + 1, need: e)));
//         } else if (e.disbursementIntervalType == "Mingguan") {
//           getIt<Logger>().d("daysOfMonth ~/ 4 ${daysOfMonth ~/ 7}");
//           weekly.addAll(List<OrdinalCalculation>.generate((daysOfMonth ~/ 7),
//               (index) => OrdinalCalculation(day: (index + 1) * 7, need: e)));
//         } else if (e.disbursementIntervalType == "Bulanan") {
//           monthly.addAll(List<OrdinalCalculation>.generate(
//               1, (index) => OrdinalCalculation(day: 1, need: e)));
//         } else if (e.disbursementIntervalType == "Tidak tentu") {
//           unexpected.add(OrdinalCalculation(
//               day: DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
//               need: e));
//         } else if (e.disbursementIntervalType == "Darurat") {
//           emergency.add(OrdinalCalculation(
//               day: DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
//               need: e));
//         }
//       }
//     }
//     if (daily.isEmpty) {
//       daily.addAll(List<OrdinalCalculation>.generate(
//           daysOfMonth,
//           (index) =>
//               OrdinalCalculation(day: index + 1, need: Necessity(amount: 0))));
//     }
//     return [
//       charts.Series<OrdinalCalculation, String>(
//         id: 'Harian',
//         domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
//         measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         data: daily
//             .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//             .toList(),
//       ),
//       charts.Series<OrdinalCalculation, String>(
//         id: 'Mingguan',
//         domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
//         measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         data: weekly
//             .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//             .toList(),
//       ),
//       charts.Series<OrdinalCalculation, String>(
//         id: 'Bulanan',
//         domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
//         measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//         colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
//         data: monthly
//             .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//             .toList(),
//       ),
//       charts.Series<OrdinalCalculation, String>(
//         id: 'Tidak Tentu',
//         domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
//         measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//         colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
//         data: unexpected
//             .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//             .toList(),
//       ),
//       charts.Series<OrdinalCalculation, String>(
//         id: 'Darurat',
//         domainFn: (OrdinalCalculation sales, _) => sales.day.toString(),
//         measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         data: emergency
//             .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//             .toList(),
//       ),
//     ];
//     // return [
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Daily',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
//     //     data: daily
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Weekly',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.green.shadeDefault,
//     //     data: weekly
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Monthly',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.purple.shadeDefault,
//     //     data: monthly
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Tidak Tentu',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.deepOrange.shadeDefault,
//     //     data: unexpected
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Darurat',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.red.shadeDefault,
//     //     data: emergency
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     // ];
//   }

//   List<StackedColumnSeries<OrdinalCalculation, int>> g2(UserNecessity needs) {
//     var daysOfMonth =
//         DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
//     Map<int, List<Necessity>> parent = {};
//     for (var i = 1; i < daysOfMonth; i++) {
//       parent[i] = [];
//     }
//     if (needs.necessity != null) {
//       for (var e in needs.necessity!) {
//         if (e.disbursementIntervalType == "Harian") {
//           for (var i = 1; i < daysOfMonth; i++) {
//             if (parent[i]!
//                 .singleWhere(
//                   (element) => element.id == e.id,
//                   orElse: () => Necessity(id: ""),
//                 )
//                 .id!
//                 .isEmpty) {
//               parent[i]?.add(e);
//             }
//           }
//         }
//       }
//     }
//     var daily = <OrdinalCalculation>[];
//     var unexpected = <OrdinalCalculation>[];
//     var monthly = <OrdinalCalculation>[];
//     var weekly = <OrdinalCalculation>[];
//     var emergency = <OrdinalCalculation>[];
//     // if (needs.necessity != null) {
//     //   for (var e in needs.necessity!) {
//     //     if (e.disbursementIntervalType == "Harian") {
//     //       parent.addAll(List<OrdinalCalculation>.generate(daysOfMonth,
//     //           (index) => OrdinalCalculation(day: index + 1, need: e)));
//     //     } else if (e.disbursementIntervalType == "Mingguan") {
//     //       getIt<Logger>().d("daysOfMonth ~/ 4 ${daysOfMonth ~/ 7}");
//     //       weekly.addAll(List<OrdinalCalculation>.generate((daysOfMonth ~/ 7),
//     //           (index) => OrdinalCalculation(day: (index + 1) * 7, need: e)));
//     //     } else if (e.disbursementIntervalType == "Bulanan") {
//     //       monthly.addAll(List<OrdinalCalculation>.generate(
//     //           1, (index) => OrdinalCalculation(day: 1, need: e)));
//     //     } else if (e.disbursementIntervalType == "Tidak tentu") {
//     //       unexpected.add(OrdinalCalculation(
//     //           day: DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
//     //           need: e));
//     //     } else if (e.disbursementIntervalType == "Darurat") {
//     //       emergency.add(OrdinalCalculation(
//     //           day: DateTime.parse(e.datetime ?? DateTime.now().toString()).day,
//     //           need: e));
//     //     }
//     //   }
//     // }

//     print("unexpected.length ${parent[5]?.length}");
//     return [
//       ...parent.keys.map(
//         (el) => StackedColumnSeries<OrdinalCalculation, int>(
//           groupName: "Harian",
//           isVisibleInLegend: (parent[el]?.fold(
//                       0.0,
//                       (double? previousValue, element) =>
//                           (previousValue ?? 0) + (element.amount ?? 0)) ??
//                   0) >
//               0,
//           xValueMapper: (OrdinalCalculation sales, _) => el,
//           // dataLabelSettings: DataLabelSettings(
//           //     isVisible: true, showCumulativeValues: true, angle: 90),
//           yValueMapper: (OrdinalCalculation sales, _) {
//             return sales.need.amount;
//             // var total = parent[el]?.fold(
//             //     0.0,
//             //     (double? previousValue, element) =>
//             //         (previousValue ?? 0) + (element.amount ?? 0));
//             // return total;
//           },
//           color: getColor(
//             parent[el]?.first.disbursementIntervalType ?? "Harian",
//           ),
//           dataSource: parent[el]!
//               .map((e) => OrdinalCalculation(need: e, day: el))
//               .toList(),
//         ),
//       ),
//       // StackedColumnSeries<OrdinalCalculation, int>(
//       //   xValueMapper: (OrdinalCalculation sales, _) => sales.day,
//       //   yValueMapper: (OrdinalCalculation sales, _) => sales.need,
//       //   color: Colors.blue,
//       //   dataSource: daily
//       //       .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//       //       .toList(),
//       // ),
//       // StackedColumnSeries<OrdinalCalculation, int>(
//       //   xValueMapper: (OrdinalCalculation sales, _) => sales.day,
//       //   yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
//       //   color: Colors.green,
//       //   dataSource: weekly
//       //       .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//       //       .toList(),
//       // ),
//       // StackedColumnSeries<OrdinalCalculation, int>(
//       //   xValueMapper: (OrdinalCalculation sales, _) => sales.day,
//       //   yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
//       //   color: Colors.purple,
//       //   dataSource: monthly
//       //       .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//       //       .toList(),
//       // ),
//       // StackedColumnSeries<OrdinalCalculation, int>(
//       //   xValueMapper: (OrdinalCalculation sales, _) => sales.day,
//       //   yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
//       //   color: Colors.deepOrange,
//       //   dataSource: unexpected
//       //       .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//       //       .toList(),
//       // ),
//       // StackedColumnSeries<OrdinalCalculation, int>(
//       //   xValueMapper: (OrdinalCalculation sales, _) => sales.day,
//       //   yValueMapper: (OrdinalCalculation sales, _) => sales.need.amount,
//       //   color: Colors.red,
//       //   dataSource: emergency
//       //       .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//       //       .toList(),
//       // ),
//     ];
//     // return [
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Daily',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
//     //     data: daily
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Weekly',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.green.shadeDefault,
//     //     data: weekly
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Monthly',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.purple.shadeDefault,
//     //     data: monthly
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Tidak Tentu',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.deepOrange.shadeDefault,
//     //     data: unexpected
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     //   Series<OrdinalCalculation, DateTime>(
//     //     id: 'Darurat',
//     //     domainFn: (OrdinalCalculation sales, _) => DateTime.parse(
//     //         sales.need.datetime ?? DateTime.now().toLocal().toString()),
//     //     measureFn: (OrdinalCalculation sales, _) => sales.need.amount,
//     //     colorFn: (_, __) => MaterialPalette.red.shadeDefault,
//     //     data: emergency
//     //         .map((e) => OrdinalCalculation(need: e.need, day: e.day))
//     //         .toList(),
//     //   ),
//     // ];
//   }

//   Color getColor(String type) {
//     switch (MainUtility.convertDisbursmentEnum(type)) {
//       case DisbursmentIntervalType.Daily:
//         return Colors.blue;
//       case DisbursmentIntervalType.Weekly:
//         return Colors.green;
//       case DisbursmentIntervalType.Monthly:
//         return Colors.purple;
//       case DisbursmentIntervalType.Unexpected:
//         return Colors.deepOrange;
//       case DisbursmentIntervalType.Emergency:
//         return Colors.red;

//       default:
//         return Colors.blue;
//     }
//   }
// }

// class OrdinalCalculation {
//   final int day;
//   final Necessity need;

//   OrdinalCalculation({required this.day, required this.need});
// }

// class _SalesData {
//   _SalesData(this.year, this.sales);

//   final String year;
//   final double sales;
// }
