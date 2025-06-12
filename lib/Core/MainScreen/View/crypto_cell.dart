import 'package:crypto_coins/Core/Models/crypto_coin.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.imageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${coinDetails.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        ); //Навигация, передаем данные через arguments
      },
    );
  }
}
