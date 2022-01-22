import 'dart:math';

class ClockCalculations {
  static String getTimeFromAngles(double angleInRadians) {
    String median = "AM";
    if (angleInRadians >= pi) {
      //Pm part
      angleInRadians -= pi;
      median = "PM";
    }
    double ratio = angleInRadians / pi;
    double hoursInHundreds = ratio * 12;
    int hour = hoursInHundreds.floor();
    int minutes = ((hoursInHundreds - hour) * 60).ceil();
    if (minutes == 60) {
      hour += 1;
      minutes = 0;
    }
    if (hour == 0) {
      hour = 12;
    }
    if (minutes < 10) {
      return "$hour:0$minutes $median";
    } else {
      return "$hour:$minutes $median";
    }
  }

  static String getDurationFromAngle(double angleDifference) {}
}
