import 'dart:convert';

import 'package:crypto_ticker/data/models/coin.dart';
import 'package:crypto_ticker/data/providers/coin_data_provider.dart';

class CoinRepo {
  Future<CoinData> getData(String symbol, [String? currency]) async {
    CoinDataProvider provider = CoinDataProvider();
    final rawData = await provider.getCoinData(symbol, currency);
    final coinData = CoinData.fromJson(jsonDecode(rawData), symbol, currency);
    return coinData;
  }
}