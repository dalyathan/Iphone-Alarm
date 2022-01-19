import 'package:alarm/widgets/containers/top_row.dart';
import 'package:alarm/widgets/icons/custom_back_button.dart';
import 'package:flutter/material.dart';

class SetAlarmTopRow extends StatelessWidget {
  const SetAlarmTopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TopRow(leftIcon: CustomBackButtonIcon(width: size.width * 0.058));
  }
}
