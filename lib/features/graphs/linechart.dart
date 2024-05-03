import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineGraph extends StatelessWidget {
  const LineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: LineChart(
          LineChartData(
            //
            // titlesData:
//              titlesData: FlTitlesData(
//                   bottomTitles: SideTitles(showTitles: false),
//                   leftTitles: SideTitles(showTitles: false),
//                   rightTitles: SideTitles(showTitles: false),
//                   topTitles: SideTitles(showTitles: false),
// ).
            //
            maxX: 12,
            maxY: 10,
            minY: 0,
            minX: 0,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 0),
                  const FlSpot(5, 7),
                  const FlSpot(7, 4),
                  const FlSpot(8, 4),
                ],
                isCurved: true,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
