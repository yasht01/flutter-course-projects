import 'package:flutter/material.dart';

import 'package:crypto_ticker/shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Bitcoin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Container(
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.7),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Settings'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.withOpacity(0.3),
                    ),
                    elevation: MaterialStateProperty.all(20),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.03,
              horizontal: MediaQuery.of(context).size.height * 0.03,
            ),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.09,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.35),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                'Crypto Details',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.45,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                'Live Graph',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.06,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.35),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeButton(
                    callback: () {},
                    text: '24H',
                    highlight: true,
                  ),
                  TimeButton(
                    callback: () {},
                    text: '1D',
                    highlight: false,
                  ),
                  TimeButton(
                    callback: () {},
                    text: '1M',
                    highlight: false,
                  ),
                  TimeButton(
                    callback: () {},
                    text: '1Y',
                    highlight: false,
                  ),
                  TimeButton(
                    callback: () {},
                    text: 'All',
                    highlight: false,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.09,
                  horizontal: MediaQuery.of(context).size.height * 0.03,
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.09,
                  minWidth: MediaQuery.of(context).size.height * 0.2,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'BUY',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: 2,
                        minHeight: 50,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0x77FFFFFF),
                      ),
                    ),
                    Text(
                      'SELL',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.37,
                ),
                child: Align(
                  alignment: Alignment(0.5, 1),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: 'Exo'),
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Bitcoin', 'Ether', 'Matic', 'Litecoin']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/$value.png',
                              height: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('$value'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey.withOpacity(0.3),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  late String text;
  late Function callback;
  late bool isHighlighted;
  TimeButton({Key? key, String? text, Function? callback, bool? highlight})
      : super(key: key) {
    this.text = text!;
    this.callback = callback!;
    this.isHighlighted = highlight!;
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;

    if (this.isHighlighted)
      buttonStyle = kSmallButtonStyle;
    else
      buttonStyle = kHighlightSmallButtonStyle;

    return ElevatedButton(
      onPressed: () => this.callback,
      child: Text(
        this.text,
        style: kLabelTextStyle,
      ),
      style: buttonStyle,
    );
  }
}
