import 'package:flutter/material.dart';
import 'dart:math';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double headWidthRatio = 0.2;
    double headHeightRatio = 0.2;
    double clockHandHorizontalLength = size.width * 0.175;
    double radius = size.height * (1 - headHeightRatio) * 0.5;
    double offshoot = size.width * 0.125;

    Paint brush = Paint();
    brush.color = const Color.fromRGBO(82, 82, 82, 1);
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    brush.strokeCap = StrokeCap.round;

    Offset A = Offset(size.width * (0.5 - headWidthRatio / 2), 0);
    Offset B = Offset(size.width * 0.5, 0);
    Offset C = Offset(size.width * (0.5 + headWidthRatio / 2), 0);
    Offset D = Offset(size.width * 0.5, size.height * headHeightRatio);
    Offset E =
        Offset(size.width / 2, size.height * (0.5 + headHeightRatio * 0.5));
    Offset F = Offset(
        E.dx + clockHandHorizontalLength, E.dy - clockHandHorizontalLength);

    Offset G = Offset(E.dx + radius / sqrt(2), E.dy - radius / sqrt(2));
    Offset H = Offset(G.dx + (offshoot / sqrt(2)), G.dy - (offshoot / sqrt(2)));

    canvas.drawLine(A, C, brush);
    canvas.drawLine(B, D, brush);
    canvas.drawLine(E, F, brush);
    canvas.drawLine(G, H, brush);
    canvas.drawCircle(E, radius, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
