import 'dart:convert';
import 'dart:io';
import 'package:crypto_ticker/data/models/coin.dart';
import 'package:http/http.dart' as http;

class CoinDataProvider {
  Future<String> getCoinData(String symbol, [String? currency]) async {
    final currencySymbol = currency == null ? "USD" : currency; 
    final url = Uri.parse("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=$symbol&convert=$currencySymbol");
    final requestHeaders = {
      "X-CMC_PRO_API_KEY": "6abc4436-7dfa-4363-92aa-9a22a274f9f7",
    };
    final response = await http.get(url, headers: requestHeaders);
    return response.body.toString();
  }
}