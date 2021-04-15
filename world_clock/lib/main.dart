import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/location.dart';

void main() => runApp(WorldApp());

class WorldApp extends StatefulWidget {
  @override
  _WorldAppState createState() => _WorldAppState();
}

class _WorldAppState extends State<WorldApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/': (context) => HomePage(),
        '/loading': (context) => Loading(),
        '/choose_location': (context) => Location(),
      },
    );
  }
}