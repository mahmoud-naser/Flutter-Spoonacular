import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  Map names_percentages;
  List Images;
  PieChartWidget({Key? key,required this.names_percentages,required this.Images}):super(key: key);

  @override
  PieChartWidgetState createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AspectRatio(
        aspectRatio: 0.5,
        child: Card(
          color: Colors.white,
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex =
                              pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: showingSections()),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    List sections = widget.names_percentages.entries.toList();
    return List.generate(widget.names_percentages.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 170.0 : 150.0;
      final widgetSize = isTouched ? 150.0 : 40.0;
      Random r=Random(i+50);
      return PieChartSectionData(
        color: Color.fromRGBO(r.nextInt(255), r.nextInt(255), r.nextInt(255), 0.9),
        value: sections[i].value,
        title: sections[i].key,
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.blue),
        badgeWidget: _Badge(
          'lib/assets/icon.png',
          size: widgetSize,
          borderColor: const Color(0xff845bef),
        ),
        badgePositionPercentageOffset: 0.98,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
      this.svgAsset, {
        Key? key,
        required this.size,
        required this.borderColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child:Image.asset('lib/Assets/image2.jpg'),
    );
  }
}
//tab on the photo to see more photos