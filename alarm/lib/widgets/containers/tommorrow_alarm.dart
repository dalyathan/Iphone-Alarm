import 'package:flutter/material.dart';

import 'heading.dart';

class TomorrowAlarm extends StatelessWidget {
  const TomorrowAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.035),
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
              width: 2, color: const Color.fromRGBO(255, 255, 255, 1))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.025),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Heading(
              mainTitle: "8:15 AM",
              smallerTitle: "Tomorrow Morning",
            ),
            OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(167, 153, 240, 1),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromRGBO(167, 153, 240, 1),
                      width: 0.05, /*style: BorderStyle.solid*/
                    ),
                    borderRadius: BorderRadius.circular(size.height * 0.025))),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.0175,
                    horizontal: size.width * 0.015),
                child: const Text(
                  "Change",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
