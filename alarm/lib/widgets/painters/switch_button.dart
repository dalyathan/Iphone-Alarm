import 'package:flutter/material.dart';

class SwitchButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = Colors.white;
    brush.strokeWidth = 5;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
