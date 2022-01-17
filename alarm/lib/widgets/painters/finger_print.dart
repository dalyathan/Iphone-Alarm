import 'package:flutter/material.dart';

class FingerPrintPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = 6 - 24 / size.width;
    brush.strokeCap = StrokeCap.round;
    double gapRatio = 0.35;
    double bPaddingRatio = 0.35;
    double fPaddingRatio = 0.125;
    double aPaddingRatio = 0.15;
    double ePaddingRatio = 0.25;

    Offset C = Offset(0, size.height * 0.7);
    Offset D = Offset(size.width, size.height * 0.1);
    double Ax = size.width * aPaddingRatio;
    double Ay = toY(C, D, C, Ax) - size.height * gapRatio;

    Offset A = Offset(Ax, Ay);
    double Bx = size.width * (1 - bPaddingRatio);
    double By = toY(C, D, A, Bx);
    Offset B = Offset(Bx, By);
    Offset E =
        Offset(size.width * ePaddingRatio, A.dy + 2 * size.height * gapRatio);
    double Fx = size.width * (1 - fPaddingRatio);
    double Fy = toY(A, B, E, Fx);
    Offset F = Offset(Fx, Fy);
    canvas.drawLine(C, D, brush);
    canvas.drawLine(A, B, brush);
    canvas.drawLine(E, F, brush);
  }

  toY(Offset refA, Offset refB, Offset from, double toX) {
    return ((refB.dy - refA.dy) / (refB.dx - refA.dx)) * (toX - from.dx) +
        from.dy;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
