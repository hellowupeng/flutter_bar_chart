import 'package:flutter/material.dart';

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter(this.animation) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = animation.value;
    final paint = Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromLTWH((size.width - barWidth) / 2.0, size.height - barHeight,
            barWidth, barHeight),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BarChartPainter oldDelegate) => false;
}
