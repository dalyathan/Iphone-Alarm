import 'package:flutter/material.dart';

class BarPainter extends CustomPainter {
  final double fillHeight;

  BarPainter(this.fillHeight);
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = size.width;
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = strokeWidth;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.fill;

    Offset top = Offset(
        size.width / 2, size.height * (1 - fillHeight) - strokeWidth / 2);
    Offset bottom = Offset(size.width / 2, size.height - strokeWidth / 2);

    canvas.drawLine(top, bottom, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
