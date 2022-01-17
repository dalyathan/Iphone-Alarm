import 'package:flutter/material.dart';

class BarPainter extends CustomPainter {
  final double fillHeight;

  BarPainter(this.fillHeight);
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = 20;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.fill;

    Offset top = Offset(size.width / 2, size.height * (1 - fillHeight));
    Offset bottom = Offset(size.width / 2, size.height);

    canvas.drawLine(top, bottom, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
