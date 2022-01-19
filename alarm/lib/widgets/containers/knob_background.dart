import 'package:flutter/material.dart';

class KnobBackground extends StatelessWidget {
  final Widget knob;
  const KnobBackground({Key? key, required this.knob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.width * 0.8,
      child: knob,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(201, 209, 220, 1),
                Color.fromRGBO(211, 219, 230, 1),
                Color.fromRGBO(221, 229, 240, 1),
                Color.fromRGBO(231, 239, 250, 1),
              ],
              stops: [
                0.1,
                0.3,
                0.8,
                1
              ])),
    );
  }
}
