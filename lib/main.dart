import 'package:crypto_coins/Core/Models/crypto_coin_details.dart';
import 'package:crypto_coins/NetworkServices/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailsAdapter());
  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

  final dio = Dio();
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => NetworkManager(dio: dio, cryptoCoinsBox: cryptoCoinsBox),
  );

  runApp(const MyApp());
}
