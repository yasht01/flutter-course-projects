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
  List names = [];

  String filterResult(int index) {
    String result = "${names[index]["name"]}";
    if (names[index]["state"] != null) result += ", ${names[index]["state"]}";
    result += ", ${names[index]["country"]}";

    return result;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    names = [];
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                    contentPadding: EdgeInsets.fromLTRB(30.0, 16, 16, 16),
                    icon: Icon(Icons.search),
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSubmitted: (String userInput) async {
                    var data =
                        await weatherModel.getSearchLocationList(userInput);
                    setState(() {
                      names = data;
                    });
                  },
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: names.length == 0 ? 0 : names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(65.0, 10.0, 30.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Color(0x99FFFFFF),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        var data = await weatherModel.getWeatherDataLatLon(
                            names[index]["lat"], names[index]["lon"]);
                        Navigator.pop(context, data);
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                        title: Text(
                          filterResult(index),
                          style: kButtonTextStyle.copyWith(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
