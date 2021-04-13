import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Test',
      home: LayoutTest(),
    );
  }
}

class LayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100.0,
              height: double.infinity,
              color: Colors.red,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.lightGreen,
                ),
              ],
            ),
            Container(
              width: 100.0,
              height: double.infinity,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
