import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:project_test1/models/heart_data.dart';

/// Local import
/// IMPORTARE DATI FINO AL MINUTO CORRENTE (E NON DI TUTTO IL GIORNO SELEZIONATO) - solo qui

///Renders default line series chart
class HRDataPlot extends StatelessWidget {
  ///Creates default line series chart
  HRDataPlot({Key? key, required this.heartData}) : super(key: key);

  final List<HeartData> heartData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'HR'),
      primaryXAxis: const DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value} HR',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getHRDataSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<HeartData, DateTime>> _getHRDataSeries() {
    return <LineSeries<HeartData, DateTime>>[
      LineSeries<HeartData, DateTime>(
          dataSource: heartData,
          xValueMapper: (data, _) => data.time,
          yValueMapper: (data, _) => data.value,
          name: 'HR',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }//_getRestDataSeries

}//RestDataPlot