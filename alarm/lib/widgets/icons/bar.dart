import 'package:alarm/widgets/painters/bar.dart';
import 'package:flutter/material.dart';

class BarIcon extends StatefulWidget {
  final double fillHeight;
  const BarIcon({Key? key, required this.fillHeight}) : super(key: key);

  @override
  _BarIconState createState() => _BarIconState();
}

class _BarIconState extends State<BarIcon> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    Size iconSize = Size(size.width * 0.05, size.height * 0.15);
    return CustomPaint(
      painter: BarPainter(widget.fillHeight),
      size: iconSize,
    );
  }
}
