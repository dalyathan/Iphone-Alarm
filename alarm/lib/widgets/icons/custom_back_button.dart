import 'package:alarm/widgets/painters/custom_back_button.dart';
import 'package:flutter/material.dart';

class CustomBackButtonIcon extends StatelessWidget {
  final double width;
  const CustomBackButtonIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.5;
    return InkWell(
        onTap: () => Navigator.pop(context),
        child: CustomPaint(
          size: Size(width, width / aspectRatio),
          painter: CustomBackButtonPainter(),
        ));
  }
}
