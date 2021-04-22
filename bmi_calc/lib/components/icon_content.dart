import 'package:flutter/material.dart';
import 'package:bmi_calc/constants.dart';

class IconContent extends StatelessWidget {
  final IconData blockIcon;
  final String iconText;

  IconContent({this.blockIcon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          blockIcon,
          size: 80.0,
        ),
        SizedBox(height: 15),
        Text(
          iconText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
