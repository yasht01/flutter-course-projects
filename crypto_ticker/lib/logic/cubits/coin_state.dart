part of 'coin_cubit.dart';

abstract class CoinState {
  CoinData? coinData;
}

class Initial extends CoinState {
  Initial() {
    coinData = CoinData(price: 0.0, percentChange: 0.0);
  }
}

class GetCoinData extends CoinState {}

class DataLoading extends CoinState {}

class DataLoaded extends CoinState {
  CoinData? coinData;

  DataLoaded({this.coinData});
}
