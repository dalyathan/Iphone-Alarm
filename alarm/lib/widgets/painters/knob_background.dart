import 'package:flutter/material.dart';

class KnobBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    assert(size.width == size.height);
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[
        Color(0xFFFFFF00),
        Color(0xFF0099FF),
      ],
      stops: <double>[0.4, 1.0],
    );
    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
