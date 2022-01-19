import 'package:flutter/material.dart';

class Knob extends StatelessWidget {
  const Knob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      height: size.width * 0.5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(241, 248, 255, 1),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(218, 224, 238, 1),
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0)
        ],
      ),
    );
  }
}
