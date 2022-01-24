import 'package:alarm/utils/clock_calc.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AlarmTimeBeingSet extends ChangeNotifier {
  String alarmTime = "12:00 PM";
  double angleInRadians = pi;
  setAlarmIconAngle(double angleInRadians) {
    this.angleInRadians = angleInRadians;
    alarmTime = ClockCalculations.getTimeFromAngles(angleInRadians);
    notifyListeners();
  }
}
