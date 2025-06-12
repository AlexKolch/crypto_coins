import 'package:crypto_coins/Core/DetailScreen/Block/crypto_coin_details_bloc.dart';
import 'package:crypto_coins/Core/Models/crypto_coin.dart';
import 'package:crypto_coins/Core/Models/crypto_coin_details.dart';

import '../Core/DetailScreen/View/Exports/view.dart';
import '../Core/MainScreen/View/Exports/view.dart';

final routes = {
        '/': (context) => const CryptoListView(),
        // '/coin': (context) => const CoinDetailView(),
};