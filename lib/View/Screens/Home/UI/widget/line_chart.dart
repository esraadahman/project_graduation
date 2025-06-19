import 'package:gradution_project/Core/Imports/common_imports.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          // getTextStyles: (value) => const TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.grey,
          // ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '1';
              case 5:
                return '2';
              case 8:
                return '3';
              default:
                return '';
            }
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          // getTextStyles: (value) => const TextStyle(
          //   color: Colors.grey,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 13,
          // ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10000:
                return '1';
              case 20000:
                return '2';
              case 30000:
                return '3';
              case 40000:
                return '4';
              case 50000:
                return '5';
              case 60000:
                return '6';
              case 70000:
                return '7';
              default:
                return '';
            }
          },
          margin: 5,
        ),
      );
}

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors;

  const LineChartWidget(
      {super.key, this.gradientColors = const [Colors.green, Colors.greenAccent]});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 70000,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey[800],
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
              color: const Color.fromARGB(255, 237, 234, 234), width: 2),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 30000),
              FlSpot(2.5, 10000),
              FlSpot(4, 50000),
              FlSpot(6, 43000),
              FlSpot(8, 40000),
              FlSpot(9, 30000),
              FlSpot(11, 38000),
            ],
            isCurved: true,
            colors: gradientColors,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: false,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.4))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
