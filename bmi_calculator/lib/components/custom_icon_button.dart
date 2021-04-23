import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData inputIconData;
  final Function onPress;

  CustomIconButton({@required this.inputIconData, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(inputIconData),
      shape: CircleBorder(),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}