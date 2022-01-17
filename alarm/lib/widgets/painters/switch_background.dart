import 'package:flutter/material.dart';

class SwitchBackgroundPainter extends CustomPainter {
  bool on;
  SwitchBackgroundPainter(this.on);
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    if (on) {
      brush.color = const Color.fromRGBO(167, 153, 240, 1);
    } else {
      brush.color = const Color.fromRGBO(220, 220, 220, 0.5);
    }
    brush.strokeWidth = size.height;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.fill;

    Offset start = Offset(size.height / 2, size.height / 2);
    Offset end = Offset(size.width - size.height / 2, size.height / 2);
    canvas.drawLine(start, end, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return on == (oldDelegate as SwitchBackgroundPainter).on;
  }
}
