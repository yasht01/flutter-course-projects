import 'package:flutter/material.dart';

var kAppTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xFF090E21),
  scaffoldBackgroundColor: Color(0xFF090E21),
);

const Color kActiveBlockColor = Color(0xFF1D1E33);
const Color kInactiveBlockColor = Color(0xFF111328);

const kActiveGender = [
  BoxShadow(color: Color(0xFFEB1555), spreadRadius: 3),
];
const kInactiveGender = [
  BoxShadow(
    color: Colors.black,
    spreadRadius: 1,
    blurRadius: 2.0,
  ),
];

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFF9695A5),
);
