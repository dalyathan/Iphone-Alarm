import 'package:flutter/material.dart';

class AlarmPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = 4;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.stroke;

    double clapperWidthRatio = 0.1;
    double clapperGapRatio = 0.1;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
