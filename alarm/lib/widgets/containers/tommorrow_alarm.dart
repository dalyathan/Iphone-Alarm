import 'package:alarm/screens/set_alarm.dart';
import 'package:alarm/state/alarm_time_being_set.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'heading.dart';

class TomorrowAlarm extends StatelessWidget {
  final double width;
  const TomorrowAlarm({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.035),
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
              width: 2, color: const Color.fromRGBO(255, 255, 255, 1))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.025),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<AlarmTimeBeingSet>(
                builder: (_, value, __) => Heading(
                      width: width * 0.4,
                      mainTitle: value.alarmTime,
                      smallerTitle: "Tomorrow Morning",
                    )),
            OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SetAlarm()),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(167, 153, 240, 1),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromRGBO(167, 153, 240, 1),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(size.height * 0.025))),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.0175,
                    horizontal: size.width * 0.015),
                child: const Text(
                  "Change",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
