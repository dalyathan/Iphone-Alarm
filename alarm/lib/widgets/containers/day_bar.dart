import 'package:alarm/widgets/icons/bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DayBar extends StatefulWidget {
  final String day;
  double marginRatio = 0.04;
  DayBar({Key? key, required this.day}) : super(key: key);

  @override
  _DayBarState createState() => _DayBarState();
}

class _DayBarState extends State<DayBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random rd = Random();
    return Column(
      children: [
        BarIcon(fillHeight: rd.nextDouble()),
        SizedBox(
          height: size.height * widget.marginRatio,
        ),
        Text(
          widget.day,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }
}
