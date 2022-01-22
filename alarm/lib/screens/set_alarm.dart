import 'package:alarm/state/alarm_time_being_set.dart';
import 'package:alarm/state/bedtime_being_set.dart';
import 'package:alarm/widgets/containers/alarm_description.dart';
import 'package:alarm/widgets/containers/heading.dart';
import 'package:alarm/widgets/containers/knob_background.dart';
import 'package:alarm/widgets/containers/set_alarm_top_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetAlarm extends StatelessWidget {
  late Size size;
  double smallerMarginRatio = 0.025;
  double horizontalPadding = 0.08;

  double verticalPadding = 0.05;
  SetAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 248, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPadding,
                vertical: size.height * verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SetAlarmTopRow(),
                SizedBox(height: size.height * smallerMarginRatio),
                KnobBackground(
                  radius: size.width * 0.775,
                ),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                const Heading(
                  mainTitle: "12 hr 15 min",
                  smallerTitle: "This schedule doesn't meet your sleep goal",
                  alignment: CrossAxisAlignment.center,
                ),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<BedTimeBeingSetProvider>(
                      builder: (__, value, _) => AlarmDescription(
                          iconData: Icons.bed,
                          title: "Bedtime",
                          width: size.width * 0.4,
                          time: value.bedTime),
                    ),
                    Consumer<AlarmTimeBeingSetProvider>(
                        builder: (__, value, _) => AlarmDescription(
                            iconData: Icons.notifications_none,
                            title: "Wake Up",
                            width: size.width * 0.4,
                            time: value.alarmTime))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
