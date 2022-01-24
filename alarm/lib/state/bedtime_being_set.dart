import 'package:alarm/utils/clock_calc.dart';
import 'package:flutter/material.dart';

class BedTimeBeingSet extends ChangeNotifier {
  String bedTime = "12:00 AM";
  double angleInRadians = 0;
  setBedIconAngle(double angleInRadians) {
    this.angleInRadians = angleInRadians;
    bedTime = ClockCalculations.getTimeFromAngles(angleInRadians);
    notifyListeners();
  }
}
