import 'package:flutter/material.dart';

import 'screens/init_page.dart';
import 'screens/home_page.dart';
import 'screens/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/init': (context) => InitPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
