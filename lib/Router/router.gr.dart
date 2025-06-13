// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CryptoListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CryptoListView(),
      );
    },
    CoinDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CoinDetailViewArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CoinDetailView(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
  };
}

/// generated route for
/// [CryptoListView]
class CryptoListRoute extends PageRouteInfo<void> {
  const CryptoListRoute({List<PageRouteInfo>? children})
      : super(
          CryptoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CoinDetailView]
class CoinDetailRoute extends PageRouteInfo<CoinDetailViewArgs> {
  CoinDetailRoute({
    Key? key,
    required CryptoCoin coin,
    List<PageRouteInfo>? children,
  }) : super(
          CoinDetailRoute.name,
          args: CoinDetailViewArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinDetailRoute';

  static const PageInfo<CoinDetailViewArgs> page =
      PageInfo<CoinDetailViewArgs>(name);
}

class CoinDetailViewArgs {
  const CoinDetailViewArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final CryptoCoin coin;

  @override
  String toString() {
    return 'CoinDetailViewArgs{key: $key, coin: $coin}';
  }
}
