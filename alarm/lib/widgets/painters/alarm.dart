import 'package:flutter/material.dart';
import 'dart:math';

class AlarmPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = 3;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.stroke;

    double clapperWidthRatio = 0.3;
    double clapperGapRatio = 0.1;
    double minutesHandRatio = 0.2;
    double hourHandRatio = 0.15;

    Offset A = Offset(
        size.width * clapperWidthRatio / 2, size.width * clapperWidthRatio / 2);

    Offset B = Offset(size.width * (1 - clapperWidthRatio / 2),
        size.width * clapperWidthRatio / 2);

    canvas.drawArc(
        Rect.fromCircle(center: A, radius: size.width * clapperWidthRatio / 2),
        -pi / 4,
        -pi,
        true,
        brush);
    canvas.drawArc(
        Rect.fromCircle(center: B, radius: size.width * clapperWidthRatio / 2),
        pi / 4,
        -pi,
        true,
        brush);

    double radiusOfClock = size.width * 0.5 * sqrt(2) -
        (A.dx * sqrt(2) + size.width * clapperGapRatio);

    double Ey = (radiusOfClock +
            size.width * clapperGapRatio +
            size.width * clapperWidthRatio / 2 * sqrt(2)) /
        sqrt(2);

    Offset E = Offset(size.width * 0.5, Ey);
    Offset C = Offset(E.dx, E.dy - size.width * minutesHandRatio);
    Offset D = Offset(E.dx + size.width * hourHandRatio, E.dy);
    Offset G =
        Offset(size.width - (size.width - 2 * radiusOfClock) / 2, size.height);
    Offset F = Offset((size.width - 2 * radiusOfClock) / 2, size.height);
    Offset H =
        Offset(E.dx - radiusOfClock / sqrt(2), E.dy + radiusOfClock / sqrt(2));
    Offset I =
        Offset(E.dx + radiusOfClock / sqrt(2), E.dy + radiusOfClock / sqrt(2));
    canvas.drawLine(E, C, brush);
    canvas.drawLine(E, D, brush);
    canvas.drawLine(F, H, brush);
    canvas.drawLine(G, I, brush);
    canvas.drawCircle(E, radiusOfClock, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
