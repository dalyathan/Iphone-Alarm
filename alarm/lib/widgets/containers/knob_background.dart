import 'package:alarm/widgets/containers/knob.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'clock.dart';

class KnobBackground extends StatefulWidget {
  final double radius;
  const KnobBackground({Key? key, required this.radius}) : super(key: key);

  @override
  State<KnobBackground> createState() => _KnobBackgroundState();
}

class _KnobBackgroundState extends State<KnobBackground> {
  double endAngle = pi;
  @override
  Widget build(BuildContext context) {
    double clockRatio = 0.625;
    double gapRatio = 0.05;
    double innerGapRatio = 0.175;
    double knobWidth = 0.1;
    double knobInnerRadiusRatio = clockRatio + innerGapRatio;
    double knobOuterRadiusRatio = knobInnerRadiusRatio + knobWidth;
    assert(knobInnerRadiusRatio < knobOuterRadiusRatio &&
        knobOuterRadiusRatio < 1);
    return Container(
      width: widget.radius,
      height: widget.radius,
      child: Stack(
        children: [
          Knob(
              radius: widget.radius,
              innerRadiusRatio: knobInnerRadiusRatio,
              outerRadiusRatio: knobOuterRadiusRatio),
          Padding(
              padding: EdgeInsets.all(widget.radius * gapRatio),
              child: Center(
                  child: Clock(
                radius: widget.radius * clockRatio,
              )))
        ],
      ),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(218, 224, 238, 1),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white,
                Color.fromRGBO(218, 224, 238, 1),
              ],
              stops: [
                0.1,
                1
              ])),
    );
  }
}
