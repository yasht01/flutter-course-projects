import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;

  BottomButton({@required this.buttonText, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFEB1555),
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
