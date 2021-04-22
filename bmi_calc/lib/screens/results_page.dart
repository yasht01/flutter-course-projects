import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import 'package:bmi_calc/components/bottom_button.dart';

class Results extends StatelessWidget {

  final String bmi;
  final String resultText;

  Results({@required this.bmi, @required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Block(
              bgColor: kActiveCardColor,
              blockChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'You have a higher than normal body weight.',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE•CALCULATE',
          ),
        ],
      ),
    );
  }
}
