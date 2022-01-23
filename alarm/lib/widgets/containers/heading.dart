import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final double width;
  final CrossAxisAlignment alignment;
  final String mainTitle;
  final String smallerTitle;
  const Heading({
    Key? key,
    required this.mainTitle,
    required this.smallerTitle,
    required this.width,
    this.alignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        SizedBox(
            width: width * 0.65,
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(mainTitle,
                    style: const TextStyle(
                        color: Color.fromRGBO(
                          54,
                          61,
                          86,
                          1,
                        ),
                        fontWeight: FontWeight.bold)))),
        SizedBox(
          width: width * 0.8,
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(smallerTitle,
                  style: const TextStyle(
                      color: Color.fromRGBO(
                        144,
                        158,
                        174,
                        1,
                      ),
                      fontWeight: FontWeight.bold))),
        )
      ],
    );
  }
}
