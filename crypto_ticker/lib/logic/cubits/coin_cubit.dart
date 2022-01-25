import 'package:bloc/bloc.dart';
import 'package:crypto_ticker/data/models/coin.dart';
import 'package:crypto_ticker/data/providers/coin_data_provider.dart';
import 'package:crypto_ticker/data/repos/coin_repo.dart';
import 'package:meta/meta.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  CoinCubit() : super(Initial());

  Future<void> getCoinData(String symbol, String currency) async {
    final coinRepo = CoinRepo();
    final coinData = await coinRepo.getData(symbol, currency);
    emit(DataLoaded(coinData: coinData));
  }

}
