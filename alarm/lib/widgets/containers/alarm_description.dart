import 'package:flutter/material.dart';

class AlarmDescription extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String time;
  final double width;
  const AlarmDescription(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.width,
      required this.time})
      : super(key: key);

  @override
  _AlarmDescriptionState createState() => _AlarmDescriptionState();
}

class _AlarmDescriptionState extends State<AlarmDescription> {
  double horizontalPadding = 0.15;
  double verticalPadding = 0.1;
  double aspectRatio = 0.8;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.width / aspectRatio,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(252, 253, 255, 1),
            borderRadius: BorderRadius.circular(widget.width * 0.25)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.width * verticalPadding,
              horizontal: widget.width * horizontalPadding),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  color: const Color.fromRGBO(167, 153, 240, 1),
                  size: widget.width * 0.3,
                ),
                Text(widget.title,
                    style: TextStyle(
                        color: const Color.fromRGBO(
                          54,
                          61,
                          86,
                          1,
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: widget.width * 0.01 * 17)),
                Text(widget.time,
                    style: TextStyle(
                        color: const Color.fromRGBO(
                          54,
                          61,
                          86,
                          1,
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: widget.width * 0.01 * 17)),
                Text("Tomorrow",
                    style: TextStyle(
                        color: const Color.fromRGBO(
                          144,
                          158,
                          174,
                          1,
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: widget.width * 0.01 * 8.5))
              ]),
        ));
  }
}
