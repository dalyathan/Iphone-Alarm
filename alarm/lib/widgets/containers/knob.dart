import 'package:alarm/widgets/painters/knob.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Knob extends StatelessWidget {
  final double innerRadius;
  final double outerRadius;
  const Knob({Key? key, required this.innerRadius, required this.outerRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: outerRadius,
        width: outerRadius,
        child: CustomPaint(
          size: Size.square(outerRadius),
          painter: KnobPainter(2 * pi, outerRadius - innerRadius),
        ));
  }
}
