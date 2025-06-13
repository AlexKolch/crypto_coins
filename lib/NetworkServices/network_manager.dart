import 'package:crypto_coins/Core/Models/crypto_coin_details.dart';
import 'package:crypto_coins/NetworkServices/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NetworkManager implements AbstractCoinsRepository {
  NetworkManager({required this.dio, required this.cryptoCoinsBox});

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoins() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchDataFromAPI();
      //Запись в Hive
      final cryptoCoinsMap = {
        for (var e in cryptoCoinsList)
          e.name: e, //делаем map из list для записи в БД
      };
      await cryptoCoinsBox.putAll(cryptoCoinsMap); //записываем в БД все данные
    } catch (e) {
      debugPrint('Internet disconnect!\n $e');
      cryptoCoinsList = cryptoCoinsBox
          .values //получение всех значений из бд
          .toList();
    }
    cryptoCoinsList.sort(
      (a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD),
    );
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchDataFromAPI() async {
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
          return CryptoCoin(name: e.key, details: details);
        }).toList();
    return dataCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromAPI(
        currencyCode,
      ); //получение одной монеты из api
      cryptoCoinsBox.put(
        currencyCode,
        coin,
      ); //записываем в БД конкретную одну монету
      return coin;
    } catch (e) {
      //проверяем, содержится ли в бд передаваемый ключ
      if (cryptoCoinsBox.containsKey(currencyCode)) {
        return cryptoCoinsBox.get(
          currencyCode,
        )!; //получаем конкретную монету из бд по ключу
      } else {
        return CryptoCoin(
          name: 'Unknown coin',
          details: CryptoCoinDetails(
            toSymbol: 'toSymbol',
            lastUpdate: DateTime.now(),
            hight24Hour: 0,
            low24Hours: 0,
            priceInUSD: 0,
            imageUrl: 'imageUrl',
          ),
        );
      }
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromAPI(String currencyCode) async {
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
