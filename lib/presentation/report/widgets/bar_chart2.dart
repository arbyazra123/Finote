import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BarChartSample4 extends StatefulWidget {
  const BarChartSample4({Key? key, required this.data}) : super(key: key);
  final List<BarChartGroupData> data;
  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  late double minX;
  late double maxX;
  @override
  void initState() {
    super.initState();
    minX = 0;
    maxX = widget.data.length.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (signal) {
        if (signal is PointerScrollEvent) {
          setState(() {
            if (signal.scrollDelta.dy.isNegative) {
              minX += maxX * 0.05;
              maxX -= maxX * 0.05;
            } else {
              minX -= maxX * 0.05;
              maxX += maxX * 0.05;
            }
          });
        }
      },
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            minX = 0;
            maxX = widget.data.length.toDouble();
          });
        },
        onHorizontalDragUpdate: (dragUpdDet) {
          setState(() {
            print(dragUpdDet.primaryDelta);
            double primDelta = dragUpdDet.primaryDelta ?? 0.0;
            if (primDelta != 0) {
              if (primDelta.isNegative) {
                minX += maxX * 0.005;
                maxX += maxX * 0.005;
              } else {
                minX -= maxX * 0.005;
                maxX -= maxX * 0.005;
              }
            }
          });
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 300,
            width: widget.data.length * 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  barTouchData: BarTouchData(
                    enabled: true,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    
                    bottomTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      
                      getTextStyles: (context, value) => const TextStyle(
                          color: Color(0xff939393), fontSize: 10),
                      margin: 10,
                      getTitles: (double value) {
                        return value.toInt().toString();
                        // switch (value.toInt()) {
                        //   case 0:
                        //     return 'Apr';
                        //   case 1:
                        //     return 'May';
                        //   case 2:
                        //     return 'Jun';
                        //   case 3:
                        //     return 'Jul';
                        //   case 4:
                        //     return 'Aug';
                        //   default:
                        //     return '';
                        // }
                      },
                    ),
                    leftTitles: SideTitles(
                      
                      showTitles: true,
                      reservedSize: 40,
                      getTextStyles: (context, value) => const TextStyle(
                          color: Color(
                            0xff939393,
                          ),
                          fontSize: 10),
                      margin: 40,
                    ),
                    topTitles: SideTitles(showTitles: false),
                    rightTitles: SideTitles(showTitles: false),
                  ),
                  // gridData: FlGridData(
                  //   show: true,

                  //   checkToShowHorizontalLine: (value) => value % 10 == 0,
                  //   getDrawingHorizontalLine: (value) => FlLine(
                  //     color: const Color(0xffe7e8ec),
                  //     strokeWidth: 1,
                  //   ),
                  // ),
                  borderData: FlBorderData(

                    show: false,
                  ),
                  
                  groupsSpace: widget.data.length.toDouble()+1,
                  barGroups: widget.data,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 17000000000,
              rodStackItems: [
                BarChartRodStackItem(0, 2000000000, dark),
                BarChartRodStackItem(2000000000, 12000000000, normal),
                BarChartRodStackItem(12000000000, 17000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 31000000000,
              rodStackItems: [
                BarChartRodStackItem(0, 11000000000, dark),
                BarChartRodStackItem(11000000000, 18000000000, normal),
                BarChartRodStackItem(18000000000, 31000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 34000000000,
              rodStackItems: [
                BarChartRodStackItem(0, 6000000000, dark),
                BarChartRodStackItem(6000000000, 23000000000, normal),
                BarChartRodStackItem(23000000000, 34000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 14000000000,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, dark),
                BarChartRodStackItem(1000000000.5, 12000000000, normal),
                BarChartRodStackItem(12000000000, 14000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
