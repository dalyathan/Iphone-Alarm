import 'package:alarm/utils/clock_calc.dart';
import 'package:flutter/material.dart';

class BedTimeBeingSetProvider extends ChangeNotifier {
  String bedTime = "12:00 AM";
  setBedTime(double angleInRadians) {
    bedTime = ClockCalculations.getTimeFromAngles(angleInRadians);
    notifyListeners();
  }
}
