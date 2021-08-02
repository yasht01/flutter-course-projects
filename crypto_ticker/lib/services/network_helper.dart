import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Map? responseData;
  String? url;

  NetworkHelper(String? symbol, String? change, String? indicators, String? apiKey, int? dataPoints) {
    url = 'https://api.lunarcrush.com/v2?data=assets&key=$apiKey&symbol=$symbol&interval=day&data_points=$dataPoints&time_series_indicators=$indicators&change=$change';
  }

  getData() async {
    http.Response response = await http.get(Uri.parse(url!));
    responseData = jsonDecode(response.body);
    print(responseData!['data'][0]['price']);
    print(responseData.runtimeType);
    return responseData!;
  }
}