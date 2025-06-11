import 'package:crypto_coins/Core/Models/crypto_coin.dart';

abstract class AbstractCoinsRepository {
Future<List<CryptoCoin>> getCoins();
}