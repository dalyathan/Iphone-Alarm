import 'package:alarm/widgets/painters/knob.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
  late double endAngle;
  late Offset endLocalOffset;
  late double startAngle;
  late Offset startLocalOffset;
  late double iconWidthRatio;
  late double knobWidthRatio;

  @override
  void initState() {
    super.initState();
    knobWidthRatio = widget.outerRadiusRatio - widget.innerRadiusRatio;
    iconWidthRatio = knobWidthRatio * 0.8;
    endAngle = pi;
    endLocalOffset = Offset(
        widget.radius * (1 - iconWidthRatio) * 0.5,
        widget.radius *
            (widget.innerRadiusRatio +
                (1 - widget.outerRadiusRatio) * 0.5 +
                (knobWidthRatio - iconWidthRatio) * 0.5));
    startAngle = 0;
    startLocalOffset = Offset(
        widget.radius * (1 - iconWidthRatio) * 0.5,
        widget.radius *
            ((1 - widget.outerRadiusRatio) * 0.5 +
                (knobWidthRatio - iconWidthRatio) * 0.5));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(
              widget.radius * (1 - widget.outerRadiusRatio) * 0.5),
          child: Container(
            color: Colors.red,
            child: CustomPaint(
              size: Size.square(widget.radius * widget.outerRadiusRatio),
              painter: KnobPainter(
                  startAngle,
                  endAngle,
                  widget.radius *
                      (widget.outerRadiusRatio - widget.innerRadiusRatio)),
            ),
          ),
        ),
        Positioned(
            key: const ObjectKey("notifications_none"),
            top: endLocalOffset.dy,
            left: endLocalOffset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    endLocalOffset.dx + details.delta.dx,
                    endLocalOffset.dy + details.delta.dy);
                print(currentLocation);
                double x = currentLocation.dx -
                    widget.radius * widget.outerRadiusRatio * 0.5;
                double y = widget.radius * widget.outerRadiusRatio * 0.5 -
                    currentLocation.dy;
                if (x >= 0) {
                  double angle = pi / 2 - atan(y / x);
                  setState(() {
                    endAngle = angle;
                    endLocalOffset = getLocalPosition(currentLocation);
                  });
                } else {
                  double angle = pi / 2 - atan(y / x) + pi;
                  setState(() {
                    endAngle = angle;
                    endLocalOffset = getLocalPosition(currentLocation);
                  });
                }
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
            key: const ObjectKey("bed"),
            top: startLocalOffset.dy,
            left: startLocalOffset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    startLocalOffset.dx + details.delta.dx,
                    startLocalOffset.dy + details.delta.dy);
                double x = currentLocation.dx -
                    widget.radius * widget.outerRadiusRatio * 0.5;
                double y = widget.radius * widget.outerRadiusRatio * 0.5 -
                    currentLocation.dy;
                if (x >= 0) {
                  double angle = pi / 2 - atan(y / x);
                  setState(() {
                    startAngle = angle;
                    startLocalOffset = getLocalPosition(currentLocation);
                  });
                } else {
                  double angle = pi / 2 - atan(y / x) + pi;
                  setState(() {
                    startAngle = angle;
                    startLocalOffset = getLocalPosition(currentLocation);
                  });
                }
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

  Offset getLocalPosition(Offset currentLocation) {
    //C= corner of box, A= top left corner of revolving icon, O= center of box
    //every corner is measured from c, so O=(widget.radius * 0.5,widget.radius * 0.5)
    double circleRadius = widget.radius *
        (widget.outerRadiusRatio * 0.5 -
            (knobWidthRatio - iconWidthRatio) * 0.5);
    //vector CO
    Offset boxCenter = Offset(widget.radius * 0.5, widget.radius * 0.5);
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
}
