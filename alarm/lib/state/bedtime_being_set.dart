import 'package:flutter/material.dart';

class BedTimeBeingSet extends ChangeNotifier {
  String bedTime = "12:00 AM";
  setSleepTime(String time) {
    bedTime = time;
    notifyListeners();
  }
}
