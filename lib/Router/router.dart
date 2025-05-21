import '../Core/DetailScreen/View/Exports/view.dart';
import '../Core/MainScreen/View/Exports/view.dart';

final routes = {
        '/': (context) => const CryptoListView(),
        '/coin': (context) => const CoinDetailView(),
};