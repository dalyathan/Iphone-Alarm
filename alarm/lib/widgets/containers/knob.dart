import 'package:alarm/widgets/painters/knob.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Knob extends StatelessWidget {
  double endAngle;
  final double radius;
  final double innerRadiusRatio;
  final double outerRadiusRatio;
  Knob(
      {Key? key,
      required this.radius,
      required this.innerRadiusRatio,
      required this.outerRadiusRatio,
      required this.endAngle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: radius,
        width: radius,
        //color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(radius * (1 - outerRadiusRatio) / 2),
          child: CustomPaint(
            size: Size.square(radius * outerRadiusRatio),
            painter: KnobPainter(
                0, endAngle, radius * (outerRadiusRatio - innerRadiusRatio)),
          ),
        ));
  }
}
