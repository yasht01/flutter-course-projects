import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Constants
import 'package:bmi_calculator/constants.dart';

// Components
import 'package:bmi_calculator/components/block.dart';
import 'package:bmi_calculator/components/custom_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

// Screens
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Map<String, dynamic> userInput = {
    "height-unit": 'cm',
    "weight-unit": 'kg',
    "selectedGender": Gender.Male,
    "height": 190.0,
    "weight": 80.0,
    "age": 20,
  };

  @override
  Widget build(BuildContext context) {

    Brain calcBrain = Brain(
      age: userInput['age'],
      height: userInput['height'].toDouble(),
      heightUnit: userInput['height-unit'],
      weight: userInput['weight'].toDouble(),
      weightUnit: userInput['weight-unit'],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Block(
                  blockChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        userInput["selectedGender"] = Gender.Male;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          color: Colors.white,
                          size: 100.0,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'MALE',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                  blockColor: userInput["selectedGender"] == Gender.Male
                      ? kActiveBlockColor
                      : kInactiveBlockColor,
                  blockShadow: userInput["selectedGender"] == Gender.Male
                      ? kActiveGender
                      : kInactiveGender,
                ),
                Block(
                  blockChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        userInput["selectedGender"] = Gender.Female;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          color: Colors.white,
                          size: 100.0,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'FEMALE',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                  blockColor: userInput["selectedGender"] == Gender.Female
                      ? kActiveBlockColor
                      : kInactiveBlockColor,
                  blockShadow: userInput["selectedGender"] == Gender.Female
                      ? kActiveGender
                      : kInactiveGender,
                )
              ],
            ),
          ),
          Block(
            blockChild: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 10.0, 12.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              userInput['height-unit'] == 'ft-in' ? userInput['height'].toStringAsFixed(1) : userInput['height'].toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 90.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButton<String>(
                      itemHeight: 100.0,
                      value: userInput["height-unit"].toString(),
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        color: Color(0xFFEB1555),
                        fontSize: 30.0,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          if(userInput['height-unit'] == 'cm' && newValue == 'ft-in')
                          {
                            userInput['height'] = calcBrain.convertToFtIn(userInput['height']);
                            userInput['height-unit'] = newValue;
                          }
                          else if(userInput['height-unit'] == 'ft-in' && newValue == 'cm')
                          {
                            userInput['height'] = calcBrain.convertToCm(userInput['height'].toDouble());
                            userInput['height-unit'] = newValue;
                          }
                        });
                      },
                      items: <String>['ft-in', 'cm']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        inputIconData: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            if(userInput['height-unit'] == 'cm')
                              userInput["height"]++;
                            else
                              userInput["height"] += 0.1;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      CustomIconButton(
                        inputIconData: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            if(userInput['height-unit'] == 'cm')
                              userInput["height"]--;
                            else
                              userInput['height'] -= 0.1;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            blockColor: kActiveBlockColor,
          ),
          Expanded(
            child: Row(
              children: [
                Block(
                  blockChild: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
                    child: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userInput['weight'].toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DropdownButton<String>(
                                itemHeight: 50.0,
                                value: userInput["weight-unit"],
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 20.0,
                                elevation: 16,
                                style: const TextStyle(
                                  color: Color(0xFFEB1555),
                                  fontSize: 20.0,
                                ),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    if(userInput['weight-unit'] == 'lb' && newValue == 'kg')
                                    {
                                      userInput['weight'] = calcBrain.convertToKg(userInput['weight']);
                                      userInput['weight-unit'] = newValue;
                                    }
                                    else if(userInput['weight-unit'] == 'kg' && newValue == 'lb')
                                    {
                                      userInput['weight'] = calcBrain.convertToLb(userInput['weight']);
                                      userInput['weight-unit'] = newValue;
                                    }
                                  });
                                },
                                items: <String>[
                                  'lb',
                                  'kg'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              inputIconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  userInput["weight"]--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0),
                            CustomIconButton(
                              inputIconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  userInput["weight"]++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  blockColor: kActiveBlockColor,
                ),
                Block(
                  blockChild: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
                    child: Column(
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userInput["age"].toString(),
                              style: TextStyle(
                                fontSize: 70.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              inputIconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  userInput["age"]--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0),
                            CustomIconButton(
                              inputIconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  userInput["age"]++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  blockColor: kActiveBlockColor,
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE BMI',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    userData: userInput,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
