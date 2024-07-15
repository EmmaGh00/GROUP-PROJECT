import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:project_test1/models/rest_data.dart';

/// Local import

///Renders default line series chart
class RestDataPlot extends StatelessWidget {
  ///Creates default line series chart
  RestDataPlot({Key? key, required this.restData}) : super(key: key);

  final List<Restdata> restData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'HR_rest'),
      primaryXAxis: const DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value} bpm',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getRestDataSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<Restdata, DateTime>> _getRestDataSeries() {
    return <LineSeries<Restdata, DateTime>>[
      LineSeries<Restdata, DateTime>(
          dataSource: restData,
          xValueMapper: (data, _) => data.time,
          yValueMapper: (data, _) => data.value,
          name: 'HR_rest',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }//_getRestDataSeries

}//RestDataPlot