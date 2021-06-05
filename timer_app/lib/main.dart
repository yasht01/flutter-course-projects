import 'package:flutter/material.dart';

import 'package:timer_app/pages/timer_page.dart';
import 'package:timer_app/services/service_locator.dart';

void main() {
  setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF2F2F2F),
      ),
      home: TimerPage(),
    );
  }
}