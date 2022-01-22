import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String mainTitle;
  final String smallerTitle;
  const Heading(
      {Key? key,
      required this.mainTitle,
      required this.smallerTitle,
      this.alignment = CrossAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(mainTitle,
            style: TextStyle(
                color: const Color.fromRGBO(
                  54,
                  61,
                  86,
                  1,
                ),
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.005 * 15)),
        Text(
          smallerTitle,
          style: TextStyle(
              color: const Color.fromRGBO(
                144,
                158,
                174,
                1,
              ),
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.005 * 8.5),
        )
      ],
    );
  }
}
