import 'package:alarm/widgets/painters/switch_background.dart';
import 'package:alarm/widgets/painters/switch_button.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final double width;
  const CustomSwitch({Key? key, required this.width}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.75;
    double buttonOffset = 0.15;
    double height = widget.width / aspectRatio;
    double ringDiameter = height * 0.6;
    Size backgroundSize = Size(widget.width, height);
    Size buttonSize = Size(ringDiameter, ringDiameter);
    return Stack(
      children: [
        Positioned(
          child: CustomPaint(
            size: backgroundSize,
            painter: SwitchBackgroundPainter(isOn),
          ),
        ),
        AnimatedPositioned(
          top: (height - ringDiameter) / 2,
          left: isOn
              ? widget.width * buttonOffset
              : widget.width * (1 - buttonOffset) - ringDiameter,
          duration: const Duration(milliseconds: 250),
          child: InkResponse(
            onTap: () => setState(() {
              isOn = isOn ? false : true;
            }),
            child: CustomPaint(
              size: buttonSize,
              painter: SwitchButtonPainter(),
            ),
          ),
        )
      ],
      // ),
    );
  }
}
