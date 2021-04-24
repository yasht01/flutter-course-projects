import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// Screens
import 'package:bmi_calculator/screens/result_interpret_page.dart';

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

    final bmi = calcBrain.calculateBMI();

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
                      UserHealthText(
                        userBMI: double.parse(bmi),
                      ),
                      Column(
                        children: [
                          Text(
                            bmi,
                            style: TextStyle(
                                fontSize: 100.0, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 20.0),
                          OutlinedButton(
                            child: Text('What does this value mean?'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultInterpretPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      UserInfoText(
                        userBMI: double.parse(bmi),
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

class UserHealthText extends StatefulWidget {
  String healthText;
  double userBMI;
  Color textColor;

  UserHealthText({@required this.userBMI});

  @override
  _UserHealthTextState createState() => _UserHealthTextState();
}

class _UserHealthTextState extends State<UserHealthText> {
  void decideText(double bmi) {
    if (bmi > 25.0) {
      widget.textColor = Colors.yellow.shade600;
      widget.healthText = 'OVERWEIGHT';
    } else if (bmi < 18.5) {
      widget.textColor = Colors.yellow.shade600;
      widget.healthText = 'UNDERWEIGHT';
    } else {
      widget.textColor = Colors.green;
      widget.healthText = 'NORMAL';
    }
  }

  @override
  void initState() {
    super.initState();
    decideText(widget.userBMI);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.healthText,
      style: TextStyle(
        color: widget.textColor,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class UserInfoText extends StatefulWidget {
  double userBMI;
  String text;
  UserInfoText({@required this.userBMI});

  @override
  _UserInfoTextState createState() => _UserInfoTextState();
}

class _UserInfoTextState extends State<UserInfoText> {
  @override
  void initState() {
    super.initState();
    decideText();
  }

  void decideText() {
    if (widget.userBMI > 25.0)
      widget.text = 'Exercise a bit more!';
    else if (widget.userBMI < 18.5)
      widget.text = 'Eat bruv!';
    else
      widget.text = 'Be like this!';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
