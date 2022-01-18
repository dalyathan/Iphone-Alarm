import 'package:flutter/material.dart';

class CustomBackButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(167, 153, 240, 1);
    brush.strokeWidth = 7.5;
    brush.strokeCap = StrokeCap.round;
    brush.strokeJoin = StrokeJoin.round;
    brush.style = PaintingStyle.stroke;
    var curveRatio = 0.3;

    Offset A =
        Offset(size.width - brush.strokeWidth / 2, brush.strokeWidth / 2);
    Offset B = Offset(
        size.width * curveRatio, size.height * 0.5 - size.width * curveRatio);
    Offset E = Offset(0, size.height * 0.5);
    Offset C = Offset(
        size.width * curveRatio, size.height * 0.5 + size.width * curveRatio);
    Offset D = Offset(size.width - brush.strokeWidth / 2,
        size.height - brush.strokeWidth / 2);

    canvas.drawLine(A, B, brush);
    canvas.drawLine(C, D, brush);
    Path path = Path();
    path.moveTo(B.dx, B.dy);
    path.quadraticBezierTo(E.dx, E.dy, C.dx, C.dy);
    canvas.drawPath(path, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
