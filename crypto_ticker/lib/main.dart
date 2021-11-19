import 'package:flutter/material.dart';

import 'presentation/screens/onboarding_page.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/init',
      routes: {
        '/home': (context) => HomePage(),
        '/init': (context) => InitPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
