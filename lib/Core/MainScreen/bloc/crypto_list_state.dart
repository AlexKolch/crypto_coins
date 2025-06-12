part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coinsList;

  CryptoListLoaded({
    required this.coinsList
    });
    
      @override
      List<Object?> get props => [coinsList]; //следит за изменениями в этой переменной (если есть, пересоздаст state)
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailure({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}