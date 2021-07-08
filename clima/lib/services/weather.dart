import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future getSearchLocationList(String userInput) async {
    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/geo/1.0/direct?q=${userInput}&appid=${kApiKey}&limit=10');

    var data = await helper.getData();
    return data;
  }

  Future<Map> getWeatherDataLatLon(double lat, double lon) async {
    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&appid=$kApiKey&units=metric');

    var data = await helper.getData();
    return data;
  }

  Future<Map> getWeatherData() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');

    var data = await helper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
