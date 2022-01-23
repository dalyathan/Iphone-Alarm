import 'package:alarm/widgets/containers/custom_switch.dart';
import 'package:alarm/widgets/containers/heading.dart';
import 'package:flutter/material.dart';

class OtherAlarms extends StatelessWidget {
  final double width;
  const OtherAlarms({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Heading(
            width: width * 0.6,
            mainTitle: "5:20 AM",
            smallerTitle: "Alarm, every day"),
        CustomSwitch(
          width: width * 0.2,
        ),
      ],
    );
  }
}
