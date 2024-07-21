import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
    
  } );

  BarChartData mainBarData() {
    return BarChartData(
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 38,
              getTitlesWidget: getTiles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        barGroups: showingGroups(),
      );
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('01', style: style);
        break;
      case 1:
        text = const Text('02', style: style);
        break;
      case 2:
        text = const Text('02', style: style);
        break;
      case 3:
        text = const Text('03', style: style);
        break;
      case 4:
        text = const Text('04', style: style);
        break;
      case 5:
        text = const Text('05', style: style);
        break;
      case 6:
        text = const Text('06', style: style);
        break;
      case 7:
        text = const Text('07', style: style);
        break;
      default:
        text = const Text(
          "",
          style: style,
        );
        break;
    }
    return SideTitleWidget(
      child: text,
      axisSide: meta.axisSide,
      space: 16,
    );
  }

  Widget leftTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;

    if (value == 0) {
      text = "\$ 1K";
    } else if (value == 1) {
      text = "\$ 2K";
    } else if (value == 2) {
      text = "\$ 3K";
    } else if (value == 3) {
      text = "\$ 4K";
    } else if (value == 4) {
      text = "\$ 5K";
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}