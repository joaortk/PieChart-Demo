import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'monitor_service.dart';

class ChartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartState();
  }
}

class _ChartState extends State<ChartWidget> {
  MonitorService service = MonitorService();
  Map<String, double> defaultMap = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.getLoginsData(),
      initialData: defaultMap,
      builder: (context, AsyncSnapshot<Map<String, double>> snapshot) {
        return PieChart(
          dataMap: snapshot.data,
          legendFontColor: Colors.blueGrey[900],
          legendFontSize: 14.0,
          legendFontWeight: FontWeight.w500,
          animationDuration: Duration(milliseconds: 2200),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 2.7,
          showChartValuesInPercentage: true,
          showChartValues: true,
          chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
        );
      },
    );
  }
}
