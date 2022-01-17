import 'package:alarm/widgets/painters/house.dart';
import 'package:flutter/material.dart';

class HouseIcon extends StatelessWidget {
  final double width;
  const HouseIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.925;
    Size houseIconSize = Size(width, width / aspectRatio);
    return CustomPaint(
      size: houseIconSize,
      painter: HousePainter(),
    );
  }
}
