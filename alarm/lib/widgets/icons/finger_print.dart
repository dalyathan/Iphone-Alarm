import 'package:alarm/widgets/painters/finger_print.dart';
import 'package:flutter/material.dart';

class FingerPrintIcon extends StatefulWidget {
  final double width;
  const FingerPrintIcon({Key? key, required this.width}) : super(key: key);

  @override
  _FingerPrintIconState createState() => _FingerPrintIconState();
}

class _FingerPrintIconState extends State<FingerPrintIcon> {
  @override
  Widget build(BuildContext context) {
    const double aspectRatio = 0.66;
    Size iconSize = Size(widget.width, widget.width / aspectRatio);
    return CustomPaint(
      size: iconSize,
      painter: FingerPrintPainter(),
    );
  }
}
