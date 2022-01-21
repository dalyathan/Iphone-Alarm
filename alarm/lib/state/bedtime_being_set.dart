import 'package:flutter/material.dart';

class BedTimeBeingSetProvider extends ChangeNotifier {
  String bedTime = "";
  set setBedTime(String bedTime) {
    this.bedTime = bedTime;
    notifyListeners();
  }
}
