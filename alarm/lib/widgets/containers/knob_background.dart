import 'package:alarm/widgets/containers/knob.dart';
import 'package:flutter/material.dart';

import 'clock.dart';

class KnobBackground extends StatelessWidget {
  final double radius;
  const KnobBackground({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double clockRatio = 0.65;
    double gapRatio = 0.05;
    double innerGapRatio = 0.175;
    double innerRadiusRatio = 0.8;
    return Container(
      width: radius,
      height: radius,
      child: Stack(
        children: [
          Positioned(
              top: radius * gapRatio,
              left: radius * gapRatio,
              child: GestureDetector(
                  onTap: () => print("bfdjwhbfjbd"),
                  child: Knob(
                      innerRadius: radius * (clockRatio + innerGapRatio),
                      outerRadius: radius * 0.9))),
          Center(
              child: Clock(
            radius: radius * clockRatio,
          ))
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
