import 'package:alarm/utils/clock_calc.dart';
import 'package:flutter/material.dart';

class AlarmTimeBeingSetProvider extends ChangeNotifier {
  String alarmTime = "12:00 PM";
  setAlarmTime(double angleInRadians) {
    alarmTime = ClockCalculations.getTimeFromAngles(angleInRadians);
    notifyListeners();
  }
}
