import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins/Core/Models/crypto_coin.dart';
import 'package:crypto_coins/Core/Models/crypto_coin_details.dart';
import 'package:flutter/material.dart';
import '../Core/DetailScreen/View/Exports/view.dart';
import '../Core/MainScreen/View/Exports/view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, path: '/'), //root screen
    AutoRoute(page: CoinDetailRoute.page),
  ];
}

// final routes = {
//         '/': (context) => const CryptoListView(),
//         '/coin': (context) => const CoinDetailView(),
// };