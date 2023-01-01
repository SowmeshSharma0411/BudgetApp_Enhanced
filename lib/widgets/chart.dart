import 'package:budgetapp/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> gradientColors = [primary, green];

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.1,
          );
        }),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
          sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String txt = '';
          switch (value.toInt()) {
            case 2:
              txt = '1';
              break;
            case 5:
              txt = '11';
              break;
            case 8:
              txt = '21';
              break;
            default:
              txt = '';
          }
          return Text(
            txt,
            style: TextStyle(color: Color(0xff67727d), fontSize: 12),
          );
        },
        //margin: 8,
      )),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String txt = '';
          switch (value.toInt()) {
            case 1:
              txt = '10k';
              break;
            case 3:
              txt = '50k';
              break;
            case 5:
              txt = '100k';
              break;
            default:
              txt = '';
          }
          return Text(txt,
              style: TextStyle(color: Color(0xff67727d), fontSize: 12));
        },
        reservedSize: 28,
        //margin: 12,
      )),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        gradient: LinearGradient(colors: gradientColors),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
