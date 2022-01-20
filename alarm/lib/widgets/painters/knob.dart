import 'package:flutter/material.dart';
import 'dart:math';

class KnobPainter extends CustomPainter {
  double startAngle;
  double endAngle;
  final double brushSize;

  KnobPainter(this.startAngle, this.endAngle, this.brushSize);
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = brushSize;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.stroke;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: (size.width - brushSize) * 0.5),
        -pi / 2 + startAngle,
        endAngle - startAngle,
        false,
        brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
