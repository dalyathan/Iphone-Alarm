import 'package:alarm/widgets/icons/bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DayBar extends StatelessWidget {
  final String day;
  double marginRatio = 0.02;
  DayBar({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random rd = Random();
    return Column(
      children: [
        BarIcon(fillHeight: rd.nextDouble() * (1 - 0.5) + 0.5),
        SizedBox(
          height: size.height * marginRatio,
        ),
        Text(
          day,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }
}
