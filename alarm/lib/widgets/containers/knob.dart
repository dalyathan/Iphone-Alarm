import 'package:alarm/state/alarm_time_being_set.dart';
import 'package:alarm/state/bedtime_being_set.dart';
import 'package:alarm/state/sleep_duration_being_set.dart';
import 'package:alarm/widgets/painters/knob.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Knob extends StatefulWidget {
  final double radius;
  final double innerRadiusRatio;
  final double outerRadiusRatio;
  const Knob(
      {Key? key,
      required this.radius,
      required this.innerRadiusRatio,
      required this.outerRadiusRatio})
      : super(key: key);

  @override
  State<Knob> createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  late double bellAngle;
  late Offset bellIconOffset;
  late double bedAngle;
  late Offset bedIconOffset;
  late double iconWidthRatio;
  late double knobWidthRatio;
  late Offset boxCenter;
  late BedTimeBeingSet bedTimeProvider;
  late AlarmTimeBeingSet alarmTimeProvider;
  late SleepDurationBeingSet sleepDurationProvider;
  final GlobalKey bellIconKey = GlobalKey();
  final GlobalKey bedIconKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    knobWidthRatio = widget.outerRadiusRatio - widget.innerRadiusRatio;
    iconWidthRatio = knobWidthRatio * 0.75;
    double centerOffset = widget.radius * (0.5 - iconWidthRatio * 0.5);
    boxCenter = Offset(centerOffset, centerOffset);
    // bellIconOffset = Offset(
    //     widget.radius * (1 - iconWidthRatio) * 0.5,
    //     widget.radius *
    //         (widget.innerRadiusRatio +
    //             (1 - widget.outerRadiusRatio) * 0.5 +
    //             (knobWidthRatio - iconWidthRatio) * 0.5));
    // bedIconOffset = Offset(
    //     widget.radius * (1 - iconWidthRatio) * 0.5,
    //     widget.radius *
    //         ((1 - widget.outerRadiusRatio) * 0.5 +
    //             (knobWidthRatio - iconWidthRatio) * 0.5));
    bellIconOffset = bedIconOffset = Offset(
        widget.radius *
            (widget.innerRadiusRatio +
                (1 - widget.outerRadiusRatio) * 0.5 +
                (knobWidthRatio - iconWidthRatio) * 0.5),
        centerOffset);
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => initializeOffsetsAndAngles(context));
  }

  @override
  Widget build(BuildContext context) {
    bedTimeProvider = Provider.of<BedTimeBeingSet>(context, listen: false);
    alarmTimeProvider = Provider.of<AlarmTimeBeingSet>(context, listen: false);
    sleepDurationProvider =
        Provider.of<SleepDurationBeingSet>(context, listen: false);
    bellAngle = alarmTimeProvider.angleInRadians;
    bedAngle = bedTimeProvider.angleInRadians;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(
              widget.radius * (1 - widget.outerRadiusRatio) * 0.5),
          child: CustomPaint(
            size: Size.square(widget.radius * widget.outerRadiusRatio),
            painter: KnobPainter(
                bedAngle,
                bellAngle,
                widget.radius *
                    (widget.outerRadiusRatio - widget.innerRadiusRatio)),
          ),
        ),
        Positioned(
            key: bellIconKey,
            top: bellIconOffset.dy,
            left: bellIconOffset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    bellIconOffset.dx + details.delta.dx,
                    bellIconOffset.dy + details.delta.dy);
                double x = currentLocation.dx - boxCenter.dx;
                double y = boxCenter.dy - currentLocation.dy;
                if (x >= 0) {
                  double angle = pi / 2 - atan(y / x);
                  setState(() {
                    bellAngle = angle;
                    bellIconOffset = getLocationOnCircle(currentLocation);
                  });
                } else {
                  double angle = pi / 2 - atan(y / x) + pi;
                  setState(() {
                    bellAngle = angle;
                    bellIconOffset = getLocationOnCircle(currentLocation);
                  });
                }
                alarmTimeProvider.setAlarmIconAngle(bellAngle);
                sleepDurationProvider.setBellAngle(bellAngle);
              },
              child: Container(
                width: iconWidthRatio * widget.radius,
                height: iconWidthRatio * widget.radius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications_none,
                    color: Color.fromRGBO(167, 153, 240, 1),
                  ),
                ),
              ),
            )),
        Positioned(
            key: bedIconKey,
            top: bedIconOffset.dy,
            left: bedIconOffset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    bedIconOffset.dx + details.delta.dx,
                    bedIconOffset.dy + details.delta.dy);
                double x = currentLocation.dx - boxCenter.dx;
                double y = boxCenter.dy - currentLocation.dy;
                if (x >= 0) {
                  double angle = pi / 2 - atan(y / x);
                  setState(() {
                    bedAngle = angle;
                    bedIconOffset = getLocationOnCircle(currentLocation);
                  });
                } else {
                  double angle = pi / 2 - atan(y / x) + pi;
                  setState(() {
                    bedAngle = angle;
                    bedIconOffset = getLocationOnCircle(currentLocation);
                  });
                }
                bedTimeProvider.setBedIconAngle(bedAngle);
                sleepDurationProvider.setBedAngle(bedAngle);
              },
              child: Container(
                width: iconWidthRatio * widget.radius,
                height: iconWidthRatio * widget.radius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.bed,
                    color: Color.fromRGBO(167, 153, 240, 1),
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Offset getLocationOnCircle(Offset currentLocation) {
    //C= corner of box, A= top left corner of revolving icon, O= center of box
    //every corner is measured from c, so O=(widget.radius * 0.5,widget.radius * 0.5)
    double circleRadius = widget.radius *
        (widget.outerRadiusRatio * 0.5 -
            (knobWidthRatio - iconWidthRatio) * 0.5 -
            iconWidthRatio * 0.5);
    //current OA= CA- CO
    double relativeX = currentLocation.dx - boxCenter.dx;
    double relativeY = currentLocation.dy - boxCenter.dy;
    //calculate norm of OA
    double oldlength = sqrt(relativeX * relativeX + relativeY * relativeY);
    //get the unit vector
    Offset unitVector = Offset(relativeX / oldlength, relativeY / oldlength);
    //get the location of the icon relative to the center of the box that lies on the purple circle
    //that means new OA
    Offset vectorFromCenter =
        Offset(unitVector.dx * circleRadius, unitVector.dy * circleRadius);
    // new CA= OA + CO
    Offset newOffset = Offset(
        boxCenter.dx + vectorFromCenter.dx, boxCenter.dy + vectorFromCenter.dy);
    return newOffset;
  }

  initializeOffsetsAndAngles(BuildContext context) {
    setState(() {
      bellIconOffset = translateAndRotate(bellIconOffset, bellAngle);
      bedIconOffset = translateAndRotate(bedIconOffset, bedAngle);
    });
  }

  Offset translateAndRotate(Offset vector, double angleInRadians) {
    double normalizedAngle = angleInRadians - pi / 2;
    Offset offsetFromBoxCenter =
        Offset(vector.dx - boxCenter.dx, vector.dy - boxCenter.dy);
    List<List<double>> rotatingFactor = [
      [cos(normalizedAngle), -sin(normalizedAngle)],
      [sin(normalizedAngle), cos(normalizedAngle)]
    ];
    Offset rotatedFromBoxCenter = Offset(
        rotatingFactor[0][0] * offsetFromBoxCenter.dx +
            rotatingFactor[0][1] * offsetFromBoxCenter.dy,
        rotatingFactor[1][0] * offsetFromBoxCenter.dx +
            rotatingFactor[1][1] * offsetFromBoxCenter.dy);
    return Offset(rotatedFromBoxCenter.dx + boxCenter.dx,
        rotatedFromBoxCenter.dy + boxCenter.dy);
  }
}
