import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:project_test1/models/sleep_data.dart';

/// Local import

///Renders default line series chart
class SleepDataPlot extends StatelessWidget {
  ///Creates default line series chart
  SleepDataPlot({Key? key, required this.sleepData}) : super(key: key);

  final List<SleepData> sleepData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Sleep'),
      primaryXAxis: const DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value} Sleep',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getSleepDataSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<SleepData, DateTime>> _getSleepDataSeries() {
    return <LineSeries<SleepData, DateTime>>[
      LineSeries<SleepData, DateTime>(
          dataSource: sleepData,
          xValueMapper: (data, _) => data.dateOfSleep,
          yValueMapper: (data, _) => data.minutesAsleep,
          name: 'Sleep',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }//_getRestDataSeries

}//RestDataPlot