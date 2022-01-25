import 'dart:core';

class CoinData {
  double? price;
  double? percentChange;
  String? currency;

  CoinData({this.price, this.percentChange, this.currency});

  CoinData.fromJson(Map<String, dynamic> json, String symbol, [String? currency])
      : price = json['data'][symbol]['quote'][currency]['price'],
        percentChange = json['data'][symbol]['quote'][currency]['percent_change_1h'];
}
