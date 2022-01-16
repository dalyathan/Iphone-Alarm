import 'package:alarm/widgets/painters/bag.dart';
import 'package:flutter/material.dart';

class BagIcon extends StatefulWidget {
  final double width;
  const BagIcon({Key? key, required this.width}) : super(key: key);

  @override
  _BagIconState createState() => _BagIconState();
}

class _BagIconState extends State<BagIcon> {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.95;
    return CustomPaint(
      size: Size(widget.width, widget.width / aspectRatio),
      painter: BagPainter(),
    );
  }
}
