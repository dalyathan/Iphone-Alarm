import 'package:alarm/widgets/painters/alarm.dart';
import 'package:flutter/material.dart';

class AlarmIcon extends StatelessWidget {
  final double width;
  const AlarmIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.9;
    return CustomPaint(
      size: Size(width, width / aspectRatio),
      painter: AlarmPainter(),
    );
  }
}
