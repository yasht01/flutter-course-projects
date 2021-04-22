import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender {
  Male,
  Female,
}

class Block extends StatelessWidget {
  final Color bgColor;
  final Widget blockChild;
  final Function onPress;

  Block({@required this.bgColor, this.blockChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: blockChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
