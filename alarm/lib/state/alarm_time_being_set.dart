import 'package:flutter/material.dart';

class AlarmTimeBeingSetProvider extends ChangeNotifier {
  String alarmTime = "";
  set setBedTime(String alarmTime) {
    this.alarmTime = alarmTime;
    notifyListeners();
  }
}
