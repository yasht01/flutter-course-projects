import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String location;
  String time;
  String flag;
  bool isDaytime;

  WorldTime({this.url, this.location, this.flag});

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      
      Map data = jsonDecode(response.body);
      
      DateTime now = DateTime.parse(data['datetime']);
      String offset = data['utc_offset'].substring(1, 3);
      String min_offset = data['utc_offset'].substring(4,);
      
      if (data['utc_offset'][0] == '+')
        now = now.add(
            Duration(hours: int.parse(offset), minutes: int.parse(min_offset)));
      else
        now = now.subtract(
            Duration(hours: int.parse(offset), minutes: int.parse(min_offset)));
      
      time = DateFormat.jm().format(now);
      isDaytime = now.hour >= 6 && now.hour <= 17;
    } on Exception catch (e) {
      print("Error: $e");
    }
  }
}
