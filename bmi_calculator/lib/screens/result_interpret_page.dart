import 'package:flutter/material.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:animate_do/animate_do.dart';

class ResultInterpretPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: AnimatedSize(
              vsync: this,
              duration: Duration(milliseconds: 600),
              child: Container(
                height: imageHeight,
                color: Colors.red,
              ),
            ),
          ),
          // AudioWave(
          //   height: 300.0,
          //   width: 300.0,
          //   spacing: 10.0,
          //   animationLoop: 1,
          //   bars: [
          //     AudioWaveBar(height: 10, color: Colors.lightBlueAccent),
          //     AudioWaveBar(height: 30, color: Colors.blue),
          //     AudioWaveBar(height: 70, color: Colors.green),
          //     AudioWaveBar(height: 40, color: Colors.red),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
  }
}
