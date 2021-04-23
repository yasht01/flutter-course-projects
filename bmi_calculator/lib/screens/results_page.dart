import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// Components
import 'package:bmi_calculator/components/block.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/brain.dart';

enum Gender { Male, Female }

class ResultsPage extends StatelessWidget {
  final Map<String, dynamic> userData;
  ResultsPage({@required this.userData});

  @override
  Widget build(BuildContext context) {
    print(userData);

    final Brain calcBrain = Brain(
      age: userData['age'],
      height: userData['height'].toDouble(),
      heightUnit: userData['height-unit'],
      weight: userData['weight'].toDouble(),
      weightUnit: userData['weight-unit'],
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Your Results'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Block(
              blockChild: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Healthy',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            calcBrain.calculateBMI(),
                            style: TextStyle(
                                fontSize: 100.0, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 20.0),
                          OutlinedButton(
                            child: Text('What does this value mean?'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/user_interpret');
                            },
                          ),
                        ],
                      ),
                      Text(
                        'Your body weight is within healthy limits',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              blockColor: kActiveBlockColor,
              blockShadow: kInactiveGender,
            ),
            BottomButton(
              buttonText: 'RE•CALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
