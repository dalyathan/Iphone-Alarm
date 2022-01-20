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

  @override
  void initState() {
    super.initState();
    endAngle = pi;
    endLocalOffset = Offset(
        widget.radius * widget.outerRadiusRatio * 0.5,
        widget.radius *
            (widget.innerRadiusRatio +
                (widget.outerRadiusRatio - widget.innerRadiusRatio) * 0.5));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: widget.radius,
            width: widget.radius,
            child: Padding(
              padding: EdgeInsets.all(
                  widget.radius * (1 - widget.outerRadiusRatio) / 2),
              child: CustomPaint(
                size: Size.square(widget.radius * widget.outerRadiusRatio),
                painter: KnobPainter(
                    0,
                    endAngle,
                    widget.radius *
                        (widget.outerRadiusRatio - widget.innerRadiusRatio)),
              ),
            )),
        Positioned(
            top: endLocalOffset.dy,
            left: endLocalOffset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    endLocalOffset.dx + details.delta.dx,
                    endLocalOffset.dy + details.delta.dy);
                double x = currentLocation.dx -
                    widget.radius * widget.outerRadiusRatio * 0.5;
                double y = widget.radius * widget.outerRadiusRatio * 0.5 -
                    currentLocation.dy;
                if (x >= 0) {
                  setState(() {
                    endAngle = pi / 2 - atan(y / x);
                    // endLocalOffset = getVector(x, y);
                    endLocalOffset = getLocalPosition(currentLocation);
                  });
                } else {
                  setState(() {
                    endAngle = pi / 2 - atan(y / x) + pi;
                    // endLocalOffset = getVector(x, y);
                    endLocalOffset = getLocalPosition(currentLocation);
                  });
                }
                print(details.globalPosition);
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
                child: const Icon(
                  Icons.notifications_none,
                  color: Color.fromRGBO(167, 153, 240, 1),
                ),
              ),
            )),
      ],
    );
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
