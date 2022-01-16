import 'package:flutter/material.dart';

class BagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(154, 141, 221, 1);
    brush.strokeWidth = 4;
    brush.strokeCap = StrokeCap.round;
    brush.style = PaintingStyle.stroke;

    double handlerLengthRatio = 0.1;
    double hanlderOffsetRatio = 0.25;
    double curveRadiusRatio = 0.2;
    double rodLocationRatio = 0.25;
    double dotRadiusRatio = 0.085;
    double dotsLocatioRatio = 0.675;

    Offset topLeftCorner = Offset(0, size.height * handlerLengthRatio);
    Offset bottomRightCorner = Offset(size.width, size.height);
    Offset A = Offset(size.width * hanlderOffsetRatio, 0);
    Offset B = Offset(
        size.width * hanlderOffsetRatio, size.height * handlerLengthRatio);
    Offset C = Offset(size.width * (1 - hanlderOffsetRatio), 0);
    Offset D = Offset(size.width * (1 - hanlderOffsetRatio),
        size.height * handlerLengthRatio);

    Offset E = Offset(0, size.height * (rodLocationRatio + handlerLengthRatio));
    Offset F = Offset(
        size.width, size.height * (rodLocationRatio + handlerLengthRatio));
    Offset G =
        Offset(size.width * hanlderOffsetRatio, size.height * dotsLocatioRatio);
    Offset H = Offset(size.width * 0.5, size.height * dotsLocatioRatio);
    Offset I = Offset(
        size.width * (1 - hanlderOffsetRatio), size.height * dotsLocatioRatio);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(topLeftCorner, bottomRightCorner),
            Radius.circular(size.width * curveRadiusRatio)),
        brush);
    canvas.drawLine(E, F, brush);
    canvas.drawLine(A, B, brush);
    canvas.drawLine(C, D, brush);
    brush.style = PaintingStyle.fill;
    canvas.drawCircle(G, size.width * dotRadiusRatio, brush);
    canvas.drawCircle(H, size.width * dotRadiusRatio, brush);
    canvas.drawCircle(I, size.width * dotRadiusRatio, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
