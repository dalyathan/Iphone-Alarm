import 'package:alarm/widgets/containers/day_bar.dart';
import 'package:flutter/material.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DayBar(day: 'M'),
        DayBar(day: 'T'),
        DayBar(day: 'W'),
        DayBar(day: 'T'),
        DayBar(day: 'F'),
        DayBar(day: 'S'),
        DayBar(day: 'S')
      ],
    );
  }
}
