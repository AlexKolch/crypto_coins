import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins/Core/Models/crypto_coin.dart';
import 'package:crypto_coins/Router/router.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${coinDetails.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        AutoRouter.of(context).push(CoinDetailRoute(coin: coin)); //навигация через AutoRouter
        // Navigator.of(context).pushNamed('/coin', arguments: coin); //Навигация, передаем данные через arguments
      }, 
    );
  }
}
