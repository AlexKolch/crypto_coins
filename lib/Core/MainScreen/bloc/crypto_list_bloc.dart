import 'package:crypto_coins/NetworkServices/abstract_coins_repository.dart';
import 'package:crypto_coins/NetworkServices/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        final fetchedCoins = await coinsRepository.getCoins(); //получение монет
        emit(CryptoListLoaded(coinsList: fetchedCoins)); //передача new state
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e)); //передача ошибки
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
