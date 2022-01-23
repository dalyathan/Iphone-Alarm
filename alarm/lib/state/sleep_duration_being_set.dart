import '../utils/clock_calc.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SleepDurationBeingSet extends ChangeNotifier {
  String totalSleepTime = "12 hr 00 min";
  double bedAngleInRadians = 0;
  double bellAngleInRadians = pi;

  setBedAngle(double bedAngleInRadians) {
    this.bedAngleInRadians = bedAngleInRadians;
    totalSleepTime = ClockCalculations.getDurationFromAngles(
        bedAngleInRadians, bellAngleInRadians);
    notifyListeners();
  }

  setBellAngle(double bellAngleInRadians) {
    this.bellAngleInRadians = bellAngleInRadians;
    totalSleepTime = ClockCalculations.getDurationFromAngles(
        bedAngleInRadians, bellAngleInRadians);
    notifyListeners();
  }
}
