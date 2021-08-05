import 'package:flutter/material.dart';

// Screens
import 'screens/home_page.dart';
import 'screens/search_city.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}