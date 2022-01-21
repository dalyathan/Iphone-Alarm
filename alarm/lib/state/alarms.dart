// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AlarmsProvider extends ChangeNotifier {
  List<String> alarms = [];

  addAlarm(String newAlarm) {
    alarms.add(newAlarm);
    notifyListeners();
  }

  getAlarms() {
    return alarms;
  }
}
