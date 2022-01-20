import 'package:alarm/widgets/containers/clock_numbers.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  final double radius;
  const Clock({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      child: Center(child: ClockNumbers(width: radius)),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(241, 248, 255, 1),
        boxShadow: [
          // BoxShadow(
          //     color: Colors.white,
          //     offset: Offset(-40.0, 0.0),
          //     blurRadius: 12.0,
          //     spreadRadius: 15.0)
        ],
      ),
    );
  }
}
