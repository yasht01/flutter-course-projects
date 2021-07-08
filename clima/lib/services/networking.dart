import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    Uri apiUrl = Uri.parse(url);
    http.Response response = await http.get(apiUrl);

    if(response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
      return data;
    }
    else {
      print(response.statusCode);
      return {'error': response.statusCode};
    }
  }
}