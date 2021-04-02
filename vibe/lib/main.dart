import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibe',
      home: HomePage(),
      color: Colors.blueGrey,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void playSound(int soundNumber) async {
    var audioPlayer = AudioCache();
    audioPlayer.play("note$soundNumber.wav");
  }

  Expanded vibeKey({Color color, int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(''),
        onPressed: () {
          return playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            vibeKey(color: Colors.red, soundNumber: 1),
            vibeKey(color: Colors.blue, soundNumber: 2),
            vibeKey(color: Colors.green, soundNumber: 3),
            vibeKey(color: Colors.yellow, soundNumber: 4),
            vibeKey(color: Colors.purple, soundNumber: 5),
            vibeKey(color: Colors.orange, soundNumber: 6),
            vibeKey(color: Colors.teal, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
