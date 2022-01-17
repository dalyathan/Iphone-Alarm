import 'package:alarm/widgets/icons/bag.dart';
import 'package:flutter/material.dart';

class TopRow extends StatefulWidget {
  final Widget leftIcon;
  const TopRow({Key? key, required this.leftIcon}) : super(key: key);

  @override
  _TopRowState createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.leftIcon,
          BagIcon(
            width: size.width * 0.11,
          )
        ],
      ),
    );
  }
}
