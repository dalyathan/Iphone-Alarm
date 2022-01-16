import 'package:alarm/widgets/containers/top_row.dart';
import 'package:alarm/widgets/icons/finger_print.dart';
import 'package:flutter/material.dart';

class MainPageTopRow extends StatelessWidget {
  const MainPageTopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TopRow(leftIcon: FingerPrintIcon(width: size.width * 0.07));
  }
}
