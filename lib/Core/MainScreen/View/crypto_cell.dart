import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.coinName
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.asset(
        'assets/img/bitcoin.png',
        width: 25,
        height: 25,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(coinName, style: theme.textTheme.bodyMedium),
      subtitle: Text('2000\$', style: theme.textTheme.labelSmall),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
        ); //Навигация, передаем данные через arguments
      },
    );
  }
}