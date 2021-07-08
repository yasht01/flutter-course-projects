import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

// Services
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat, lon;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    Map data = await WeatherModel().getWeatherData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationData: data,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.indigo,
          size: 100.0,
        ),
      ),
    );
  }
}
