import 'package:flutter/material.dart';

class SleepDurationBeingSet extends ChangeNotifier {
  String totalSleepTime = "12 hr 00 min";

  setSleepDuration(String totalSleepTime) {
    this.totalSleepTime = totalSleepTime;
    notifyListeners();
  }
}
