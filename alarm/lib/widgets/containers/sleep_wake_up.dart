import 'package:flutter/material.dart';

class SleepWakeUp extends StatelessWidget {
  const SleepWakeUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Sleep | Wake up",
            style: TextStyle(
                color: const Color.fromRGBO(
                  54,
                  61,
                  86,
                  1,
                ),
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.005 * 10)),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.1),
              color: const Color.fromRGBO(167, 153, 240, 1),
              border: Border.all(
                  width: 2, color: const Color.fromRGBO(167, 153, 240, 1))),
          child: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
