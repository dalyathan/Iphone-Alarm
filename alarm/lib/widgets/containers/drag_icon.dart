import 'package:flutter/material.dart';
import 'dart:math';

class DragIcon extends StatefulWidget {
  final IconData iconData;
  final double radius;
  final double outerRadiusRatio;
  final double innerRadiusRatio;
  final Function(double, Offset) updateAngle;
  Offset location;
  double angleInRadians;
  DragIcon(
      {Key? key,
      required this.iconData,
      required this.location,
      required this.angleInRadians,
      required this.radius,
      required this.outerRadiusRatio,
      required this.innerRadiusRatio,
      required this.updateAngle})
      : super(key: key);

  @override
  _DragIconState createState() => _DragIconState();
}

class _DragIconState extends State<DragIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget.location.dy,
        left: widget.location.dx,
        child: GestureDetector(
          onPanUpdate: (details) {
            Offset currentLocation = Offset(
                widget.location.dx + details.delta.dx,
                widget.location.dy + details.delta.dy);
            double x = currentLocation.dx -
                widget.radius * widget.outerRadiusRatio * 0.5;
            double y = widget.radius * widget.outerRadiusRatio * 0.5 -
                currentLocation.dy;
            if (x >= 0) {
              double angle = pi / 2 - atan(y / x);
              widget.updateAngle(angle, getLocalPosition(currentLocation));
            } else {
              double angle = pi / 2 - atan(y / x) + pi;
              widget.updateAngle(angle, getLocalPosition(currentLocation));
            }
          },
          child: Container(
            width: widget.radius *
                (widget.outerRadiusRatio - widget.innerRadiusRatio),
            height: widget.radius *
                (widget.outerRadiusRatio - widget.innerRadiusRatio),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              widget.iconData,
              color: const Color.fromRGBO(167, 153, 240, 1),
            ),
          ),
        ));
  }

  Offset getLocalPosition(Offset currentLocation) {
    double relativeX =
        currentLocation.dx - widget.radius * widget.outerRadiusRatio * 0.5;
    double relativeY =
        widget.radius * widget.outerRadiusRatio * 0.5 - currentLocation.dy;
    double oldlength = sqrt(relativeX * relativeX + relativeY * relativeY);
    Offset unitVector = Offset(relativeX / oldlength, relativeY / oldlength);
    Offset newVector = Offset(
        unitVector.dx * widget.radius * widget.innerRadiusRatio * 0.5,
        unitVector.dy * widget.radius * widget.innerRadiusRatio * 0.5);
    return Offset(newVector.dx + widget.radius * widget.outerRadiusRatio * 0.5,
        widget.radius * widget.outerRadiusRatio * 0.5 - newVector.dy);
  }
}
