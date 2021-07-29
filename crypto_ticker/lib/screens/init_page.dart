import 'dart:ui';

import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
              ),
              Align(
                alignment: Alignment(0.9, 0.5),
                child: Container(
                  color: Colors.blue.withOpacity(0.9),
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          ),
          Container(
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50.0,
                sigmaY: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Crypto Tracker',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.bold,
                        fontSize: 80.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Track all cryptocurrencies in one app',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CryptoName(inputText: 'Bitcoin'),
                        CryptoName(inputText: 'Ether'),
                        CryptoName(inputText: 'LTC'),
                        CryptoName(inputText: 'MATIC'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Align(
                    alignment: Alignment(0.9, 1),
                    child: Text(
                      'and more..',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.6),
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Icon(
                        Icons.east,
                        size: 60,
                      ),
                      splashColor: Colors.blue.withOpacity(1.0),
                      shape: CircleBorder(),
                      elevation: 0,
                      highlightElevation: 0,
                      fillColor: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoName extends StatelessWidget {
  late String? text;
  CryptoName({Key? key, String? inputText}) : super(key: key) {
    this.text = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Text(
            text!,
            style: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
