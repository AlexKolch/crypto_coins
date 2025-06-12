import 'package:crypto_coins/Core/Models/crypto_coin_details.dart';
import 'package:crypto_coins/NetworkServices/crypto_coins.dart';
import 'package:dio/dio.dart';

class NetworkManager implements AbstractCoinsRepository {
  NetworkManager({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoins() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID&tsyms=USD',
    );
    // debugPrint(response.toString());

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataCoinsList =
        dataRaw.entries.map((e) {
          final usdData =
              (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
               final details = CryptoCoinDetails.fromJson(usdData);
          // final price = usdData['PRICE'];
          // final imageUrl = usdData['IMAGEURL'];
          return CryptoCoin(
            name: e.key,
            details: details
            // priceWithUSD: price,
            // imageURL: 'https://www.cryptocompare.com$imageUrl',
          );
        }).toList();

    return dataCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData["USD"] as Map<String, dynamic>;
    final details = CryptoCoinDetails.fromJson(usdData);
    return CryptoCoin(name: currencyCode, details: details);
  }
}
