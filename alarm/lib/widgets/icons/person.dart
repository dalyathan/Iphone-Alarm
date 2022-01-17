import 'package:alarm/widgets/painters/person.dart';
import 'package:flutter/material.dart';

class PersonIcon extends StatelessWidget {
  final double width;
  const PersonIcon({Key? key, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.925;
    return CustomPaint(
      size: Size(width, width / aspectRatio),
      painter: PersonPainter(),
    );
  }
}
