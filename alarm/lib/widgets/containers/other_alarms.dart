import 'package:alarm/widgets/containers/heading.dart';
import 'package:flutter/material.dart';

class OtherAlarms extends StatelessWidget {
  const OtherAlarms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Heading(mainTitle: "5:20 AM", smallerTitle: "Alarm, every day")
      ],
    );
  }
}
