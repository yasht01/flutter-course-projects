import 'package:flutter/material.dart';

// Components
import 'package:weather/components/navbar.dart';

// Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, -1.0),
                  radius: 1.5,
                  colors: [
                    const Color(0xff68b4ff),
                    const Color(0xff5274ee),
                  ],
                  stops: [0.4, 1.0],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 80.0),
                  Text(
                    'Apr 28, 2021',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Ho Chi Minh',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontFamily: 'Montserrat',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Image.asset(
                    "assets/images/sun.png",
                    width: 150.0,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Sunny',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'Montserrat',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '40°',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.18,
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.025),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.0,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Icon(
                                FontAwesomeIcons.wind,
                                color: Colors.white.withOpacity(0.8),
                                size: 38,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                '3.1 mph',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.0,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Icon(
                                FontAwesomeIcons.tint,
                                color: Colors.white.withOpacity(0.8),
                                size: 38,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                '70%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Feeling',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.0,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Icon(
                                FontAwesomeIcons.thermometerHalf,
                                color: Colors.white.withOpacity(0.8),
                                size: 38,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                '38°',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.28),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
