import 'package:alarm/state/alarm_time_being_set.dart';
import 'package:alarm/state/bedtime_being_set.dart';
import 'package:alarm/state/sleep_duration_being_set.dart';
import 'package:alarm/widgets/containers/alarm_description.dart';
import 'package:alarm/widgets/containers/heading.dart';
import 'package:alarm/widgets/containers/knob_background.dart';
import 'package:alarm/widgets/containers/set_alarm_top_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetAlarm extends StatelessWidget {
  double smallerMarginRatio = 0.025;
  double horizontalPadding = 0.08;

  double verticalPadding = 0.05;
  SetAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                Consumer<SleepDurationBeingSet>(
                    builder: (_, value, __) => SizedBox(
                        width: size.width * 0.45,
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(value.totalSleepTime,
                                style: const TextStyle(
                                    color: Color.fromRGBO(
                                      54,
                                      61,
                                      86,
                                      1,
                                    ),
                                    fontWeight: FontWeight.bold))))),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<BedTimeBeingSet>(
                      builder: (__, value, _) => AlarmDescription(
                          iconData: Icons.bed,
                          title: "Bedtime",
                          width: size.width * 0.4,
                          time: value.bedTime),
                    ),
                    Consumer<AlarmTimeBeingSet>(
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
