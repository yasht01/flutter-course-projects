import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontFamily: 'Exo',
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
