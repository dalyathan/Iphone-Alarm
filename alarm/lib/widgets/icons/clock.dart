import 'package:alarm/widgets/painters/clock.dart';
import 'package:flutter/material.dart';

class ClockIcon extends StatelessWidget {
  final double width;
  const ClockIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.925;
    return CustomPaint(
      size: Size(width, width / aspectRatio),
      painter: ClockPainter(),
    );
  }
}
