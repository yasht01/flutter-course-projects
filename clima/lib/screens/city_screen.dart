import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController _controller;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controller,
                  style: kButtonTextStyle.copyWith(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    icon: Icon(Icons.search),
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSubmitted: (String userInput) async {
                    var data = await weatherModel.getSearchLocationList(userInput);
                    print(data);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
