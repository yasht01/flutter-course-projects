import 'package:crypto_ticker/services/network_helper.dart';

class CoinData {
  double? price;
  List? graphSeriesData;
  Map? _coinData;
  String? _apiKey = 'w8j7mlmeozkxecz8jy3grc';
  
  String? symbol;
  String? indicators;
  String? change;
  int? dataPoints;

  CoinData({this.symbol, this.indicators, this.change, this.dataPoints});

  getCoinMarketData() async {
    NetworkHelper helper = NetworkHelper(symbol, change, indicators, _apiKey, dataPoints);
    this._coinData = await helper.getData();
    // this.price = _coinData!['data'][0]['price'];
    // print(this.price);
    // this.graphSeriesData = _coinData!['data'][0]['timeSeries'];
    print(this._coinData!['data'][0]['price']);
  }
}

main(List<String> args) async {
  CoinData coin = CoinData(symbol: 'MATIC', indicators: 'close', change: '1m', dataPoints: 30);
  coin.getCoinMarketData();
  // print(coin.price);
}