import 'package:flutter/material.dart';

class AlarmTimeBeingSet extends ChangeNotifier {
  String alarmTime = "12:00 PM";
  setAlarmTime(String time) {
    alarmTime = time;
    notifyListeners();
  }
}
