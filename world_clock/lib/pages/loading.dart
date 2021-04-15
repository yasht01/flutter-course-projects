import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.jpg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/', arguments: {
      'url': instance.url,
      'time': instance.time,
      'location': instance.location,
      'isDaytime': instance.isDaytime,
      'flag': instance.flag,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SpinKitWave(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
