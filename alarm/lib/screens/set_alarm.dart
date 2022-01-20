import 'package:alarm/widgets/containers/knob_background.dart';
import 'package:alarm/widgets/containers/set_alarm_top_row.dart';
import 'package:flutter/material.dart';

class SetAlarm extends StatelessWidget {
  late Size size;
  double smallerMarginRatio = 0.025;
  double horizontalPadding = 0.1;

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SetAlarmTopRow(),
                          SizedBox(height: size.height * smallerMarginRatio),
                          Center(
                              child: KnobBackground(
                            radius: size.width * 0.775,
                          ))
                        ])))));
  }
}
