import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:crypto_ticker/presentation/shared/constants.dart';

class TimeButton extends StatelessWidget {
  late String text;
  late Function callback;
  late bool isHighlighted;
  TimeButton({Key? key, String? text, Function? callback, bool? highlight})
      : super(key: key) {
    this.text = text!;
    this.callback = callback!;
    this.isHighlighted = highlight!;
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;

    if (this.isHighlighted)
      buttonStyle = kSmallButtonStyle;
    else
      buttonStyle = kHighlightSmallButtonStyle;

    return ElevatedButton(
      onPressed: () => this.callback,
      child: Text(
        this.text,
        style: kLabelTextStyle,
      ),
      style: buttonStyle,
    );
  }
}

class GraphWidget extends StatefulWidget {
  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  List<Color> gradientColors = [
    const Color(0xffFF74AE),
    const Color(0xffFE4694),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 0.9,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(mainData()),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
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
          isCurved: false,
          colors: [Color(0xFFFFB2E5).withOpacity(0.9)],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.7)).toList(),
            gradientFrom: Offset(0, 0.5),
            gradientTo: Offset(0, 1),
          ),
        ),
      ],
    );
  }
}
