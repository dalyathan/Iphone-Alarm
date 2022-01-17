import 'package:alarm/widgets/containers/custom_switch.dart';
import 'package:alarm/widgets/containers/heading.dart';
import 'package:flutter/material.dart';

class OtherAlarms extends StatelessWidget {
  const OtherAlarms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Heading(mainTitle: "5:20 AM", smallerTitle: "Alarm, every day"),
        CustomSwitch(
          height: size.height * 0.045,
        ),
      ],
    );
  }
}
