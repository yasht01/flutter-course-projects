import 'package:flutter/material.dart';

import 'screens/init_page.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: InitPage(),
      initialRoute: '/init',
      routes: {
        '/home': (context) => HomePage(),
        '/init': (context) => InitPage(),
      },
    );
  }
}
