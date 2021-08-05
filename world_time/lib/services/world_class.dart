import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url, this.isDaytime});

  Future<void> getDate() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      DateTime now = DateTime.parse(data['datetime']);
      String offset = data['utc_offset'].substring(1, 3);
      String min_offset = data['utc_offset'].substring(
        4,
      );

      if (data['utc_offset'][0] == '+')
        now = now.add(
            Duration(hours: int.parse(offset), minutes: int.parse(min_offset)));
      else
        now = now.subtract(
            Duration(hours: int.parse(offset), minutes: int.parse(min_offset)));

      time = intl.DateFormat.jm().format(now);

      isDaytime = now.hour >= 6 && now.hour <= 17;

    } catch (e) {
      print('Error: $e');
      time = 'NULL';
    }
  }
}
