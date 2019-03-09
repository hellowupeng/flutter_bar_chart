import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'bar_chart_painter.dart';
import 'package:flutter/animation.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage>
    with SingleTickerProviderStateMixin {
  final random = Random();
  int dataSet = 50;
  AnimationController animation;
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = Tween<double>(begin: 0, end: dataSet.toDouble());
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
      tween = Tween(begin: tween.evaluate(animation), end: dataSet.toDouble());
      animation.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: CustomPaint(
            size: Size(200, 100),
            painter: BarChartPainter(tween.animate(animation)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: changeData,
        ),
      );
}
