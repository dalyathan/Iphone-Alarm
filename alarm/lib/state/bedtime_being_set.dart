import 'package:alarm/utils/clock_calc.dart';
import 'package:flutter/material.dart';

class BedTimeBeingSet extends ChangeNotifier {
  String bedTime = "12:00 AM";
  setBedIconAngle(double angleInRadians) {
    bedTime = ClockCalculations.getTimeFromAngles(angleInRadians);
    notifyListeners();
  }
}
