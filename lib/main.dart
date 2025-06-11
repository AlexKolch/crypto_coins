import 'package:crypto_coins/NetworkServices/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';

void main() {
  GetIt.I.registerSingleton<AbstractCoinsRepository>(NetworkManager(dio: Dio()));
  runApp(const MyApp());
}

