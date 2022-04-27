import 'dart:math';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import '../../../application/user_necessity/user_necessity_bloc.dart';
import 'calculation_result.dart';
import 'necessity_day_dialog.dart';

class StackedBarChart extends StatelessWidget {
  final List<charts.Series<OrdinalCalculation, String>> seriesList;
  final bool animate;
  final UserNecessityState userNecessityState;

  const StackedBarChart(
    this.seriesList,
    this.userNecessityState, {
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    // List<OrdinalCalculation> currData = [];
    print(DateTime.now().toLocal().toString());
    return Builder(builder: (context) {
      return charts.BarChart(
        seriesList,
        animate: animate,
        behaviors: [
          charts.SlidingViewport(
              // charts.SelectionModelType.info,

              ),
          charts.PanAndZoomBehavior(),
          charts.SeriesLegend(
            position: charts.BehaviorPosition.top,
            desiredMaxColumns: MediaQuery.of(context).size.width > 850 ? 1 : 3,
            outsideJustification: OutsideJustification.middle,
          ),
          // charts.LinePointHighlighter(
          //   ////////////////////// notice ////////////////////////////
          //   symbolRenderer: TextSymbolRenderer(
          //     () {
          //       List<OrdinalCalculation> data = [];
          //       for (var element in widget.seriesList) {
          //         for (var element in element.data) {
          //           data.add(element);
          //         }
          //       }
          //       var x = data.where((element) => element.day == index).toList();
          //       currData = x;
          //       return x
          //           .fold(
          //               0.0,
          //               (double previousValue, element) =>
          //                   previousValue + (element.need.amount ?? 0))
          //           .toString();
          //     },
          //     () {
          //       List<OrdinalCalculation> data = [];
          //       for (var element in widget.seriesList) {
          //         for (var element in element.data) {
          //           data.add(element);
          //         }
          //       }
          //       var x = data.where((element) => element.day == index).toList();
          //       return x.length;
          //     },
          //     () {
          //       List<OrdinalCalculation> data = [];
          //       for (var element in widget.seriesList) {
          //         for (var element in element.data) {
          //           data.add(element);
          //         }
          //       }
          //       var x = data.where((element) => element.day == index).toList();
          //       return [...x.map((e) => e.need.amount.toString()).toList()];
          //     },
          //     isShow: true,
          //   ),
          //   ////////////////////// notice ////////////////////////////
          // ),
        ],
        defaultInteractions: true,
        primaryMeasureAxis: charts.NumericAxisSpec(
            tickFormatterSpec:
                charts.BasicNumericTickFormatterSpec.fromNumberFormat(
                    NumberFormat.compactSimpleCurrency())),

        domainAxis: charts.OrdinalAxisSpec(
          showAxisLine: false,
          viewport: OrdinalViewport(
            "0",
            14,
          ),
        ),

        defaultRenderer: charts.BarRendererConfig(
            // By default, bar renderer will draw rounded bars with a constant
            // radius of 30.
            // To not have any rounded corners, use [NoCornerStrategy]
            // To change the radius of the bars, use [ConstCornerStrategy]
            strokeWidthPx: 5,
            cornerStrategy: charts.ConstCornerStrategy(1)),
        // dateTimeFactory: const charts.LocalDateTimeFactory(),
        selectionModels: [
          charts.SelectionModelConfig(
            changedListener: (SelectionModel model) {
              // print(model.selectedDatum[0].datum.day.toString());
              // setState(() {
              //   index = model.selectedDatum[0].datum.day ?? 0;
              // });
              var now = DateTime.now();
              showDayOfNecessity(
                  context,
                  DateTime(now.year, now.month,
                      model.selectedDatum[0].datum.day ?? 0),
                  userNecessityState);
            },
          )
        ],
        // vertical: MediaQuery.of(context).size.width > 850,
        // barGroupingType: charts.BarGroupingType.groupedStacked,
      );
    });
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

// class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
//   @override
//   void paint(ChartCanvas canvas, Rectangle<num> bounds,
//       {List<int>? dashPattern,
//       Color? fillColor,
//       FillPatternType? fillPattern,
//       Color? strokeColor,
//       double? strokeWidthPx}) {
//     super.paint(canvas, bounds,
//         dashPattern: dashPattern,
//         fillColor: fillColor,
//         strokeColor: strokeColor,
//         strokeWidthPx: strokeWidthPx);
//     canvas.drawRect(
//         Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
//             bounds.height + 10),
//         fill: Color.white);
//     var textStyle = style.TextStyle();
//     textStyle.color = Color.black;
//     textStyle.fontSize = 15;
//     canvas.drawText(element.TextElement("1", style: textStyle),
//         (bounds.left).round(), (bounds.top - 28).round());
//   }
// }

// typedef GetText = String Function();
// typedef GetLengthData = int Function();
// typedef GetAllData = List<String> Function();

// class TextSymbolRenderer extends CircleSymbolRenderer {
//   TextSymbolRenderer(this.getText, this.getLengthData, this.getAllData,
//       {this.marginBottom = 8,
//       this.padding = const EdgeInsets.all(8),
//       this.i = 0,
//       this.isShow = true});

//   final GetText getText;
//   final GetLengthData getLengthData;
//   final GetAllData getAllData;
//   final double marginBottom;
//   final EdgeInsets padding;
//   final bool isShow;

//   int i = 0;

//   @override
//   void paint(ChartCanvas canvas, Rectangle<num> bounds,
//       {List<int>? dashPattern,
//       Color? fillColor,
//       FillPatternType? fillPattern,
//       Color? strokeColor,
//       double? strokeWidthPx}) {
//     super.paint(canvas, bounds,
//         dashPattern: dashPattern,
//         fillColor: fillColor,
//         fillPattern: fillPattern,
//         strokeColor: strokeColor,
//         strokeWidthPx: strokeWidthPx);
//     if (i == 0) {
//       i = getLengthData.call();
//     } else {
//       i -= 1;
//     }
//     debugPrint("i -= 1 ${i}");
//     if (!isShow) return;
//     style.TextStyle textStyle = style.TextStyle();
//     textStyle.color = Color.black;
//     textStyle.fontSize = 15;
//     // debugPrint("bounds.toString() ${bounds.}");
//     // if (i != getAllData.call().length) {
//     element.TextElement textElement =
//         element.TextElement(getText.call(), style: textStyle);
//     double width = textElement.measurement.horizontalSliceWidth;
//     double height = textElement.measurement.verticalSliceWidth;

//     double centerX = bounds.left + bounds.width / 2;
//     double centerY = bounds.top +
//         bounds.height / 2 -
//         marginBottom -
//         (padding.top + padding.bottom);
//     if (i == getLengthData.call()) {
//       canvas.drawRRect(
//         Rectangle(
//           centerX - (width / 2) - padding.left,
//           centerY - (height / 2) - padding.top,
//           width + (padding.left + padding.right),
//           height + (padding.top + padding.bottom),
//         ),
//         fill: Color.white,
//         radius: 16,
//         roundTopLeft: true,
//         roundTopRight: true,
//         roundBottomRight: true,
//         roundBottomLeft: true,
//       );
//       canvas.drawText(
//         textElement,
//         (centerX - (width / 2)).round(),
//         (centerY - (height / 2)).round(),
//       );
//     }
//   }
// }
