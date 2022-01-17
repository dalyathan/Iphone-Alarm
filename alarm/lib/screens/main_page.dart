import 'package:alarm/widgets/containers/heading.dart';
import 'package:alarm/widgets/containers/main_page_top_row.dart';
import 'package:alarm/widgets/containers/other_alarms.dart';
import 'package:alarm/widgets/containers/sleep_wake_up.dart';
import 'package:alarm/widgets/containers/tommorrow_alarm.dart';
import 'package:alarm/widgets/containers/week_days.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  late Size size;
  double smallerMarginRatio = 0.025;
  double horizontalPadding = 0.1;
  double verticalPadding = 0.05;
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 248, 255, 1),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * horizontalPadding,
            vertical: size.height * verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainPageTopRow(),
            SizedBox(height: size.height * smallerMarginRatio),
            const Heading(
              mainTitle: "Average Sleep",
              smallerTitle: "7 hours last week",
            ),
            SizedBox(height: size.height * smallerMarginRatio),
            const WeekDays(),
            SizedBox(height: size.height * smallerMarginRatio),
            const SleepWakeUp(),
            SizedBox(height: size.height * smallerMarginRatio / 2),
            horizontalRule(),
            SizedBox(height: size.height * smallerMarginRatio),
            const TomorrowAlarm(),
            SizedBox(height: size.height * smallerMarginRatio / 2),
            other(),
            SizedBox(height: size.height * smallerMarginRatio),
            horizontalRule(),
            SizedBox(height: size.height * smallerMarginRatio),
            const OtherAlarms(),
          ],
        ),
      )),
    );
  }

  Container horizontalRule() {
    return Container(
      color: const Color.fromRGBO(167, 153, 240, 1),
      height: 0.5,
      width: size.width * (1 - 2 * horizontalPadding),
    );
  }

  Padding other() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Text("other",
          style: TextStyle(
              color: const Color.fromRGBO(
                54,
                61,
                86,
                1,
              ),
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.005 * 12)),
    );
  }
}
