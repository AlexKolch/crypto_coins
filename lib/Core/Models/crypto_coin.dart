import 'package:crypto_coins/Core/Models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final CryptoCoinDetails details;

  const CryptoCoin({required this.name, required this.details});

  @override
  List<Object?> get props => [name, details];
}
