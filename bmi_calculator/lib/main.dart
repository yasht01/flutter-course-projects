import 'package:flutter/material.dart';

// Screens
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/screens/result_interpret_page.dart';

// Constants
import 'package:bmi_calculator/constants.dart';


void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      home: InputPage(),
    );
  }
}