import 'package:crypto_coins/Core/Models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkManager {
  Future<List<CryptoCoin>> getCoins() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID&tsyms=USD',
    );
    debugPrint(response.toString());

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataCoinsList =
        dataRaw.entries.map((e) {
          final usdData =
              (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          final price = usdData['PRICE'];
          final imageUrl = usdData['IMAGEURL'];
          return CryptoCoin(
            name: e.key,
            priceWithUSD: price,
            imageURL: 'https://www.cryptocompare.com$imageUrl',
          );
        }).toList();

    return dataCoinsList;
  }
}
