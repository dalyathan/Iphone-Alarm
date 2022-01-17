import 'package:alarm/widgets/painters/switch_background.dart';
import 'package:alarm/widgets/painters/switch_button.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final double height;
  const CustomSwitch({Key? key, required this.height}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool on = true;
  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.75;
    double buttonOffset = 0.15;
    double widgetWidth = widget.height * aspectRatio;
    double ringDiameter = widget.height * 0.6;
    Size backgroundSize = Size(widgetWidth, widget.height);
    Size buttonSize = Size(ringDiameter, ringDiameter);
    return GestureDetector(
      onTapDown: (data) => setState(() {
        on = on ? false : true;
      }),
      child: Stack(
        children: [
          Positioned(
            child: CustomPaint(
              size: backgroundSize,
              painter: SwitchBackgroundPainter(on),
            ),
          ),
          AnimatedPositioned(
            top: (widget.height - ringDiameter) / 2,
            left: on
                ? widgetWidth * buttonOffset
                : widgetWidth * (1 - buttonOffset) - ringDiameter,
            duration: const Duration(milliseconds: 250),
            child: CustomPaint(
              size: buttonSize,
              painter: SwitchButtonPainter(),
            ),
          )
        ],
      ),
    );
  }
}
