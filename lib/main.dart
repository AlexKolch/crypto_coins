import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //MARK: - Widget application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto coins',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        dividerColor: Colors.white24,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      // home: const CryptoListView(), //иниц уже в routes
      routes: {
        //MARK: - Routing
        '/': (context) => CryptoListView(),
        '/coin': (context) => CoinView(),
      },
    );
  }
}

class CryptoListView extends StatefulWidget {
  const CryptoListView({super.key});

  final String title = 'Crypto coins';

  @override
  State<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends State<CryptoListView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10, //Кол-во ячеек
        itemBuilder: (context, index) {
          const coinName = 'Bitcoin';
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
        },
      ),
    );
  }
}

class CoinView extends StatefulWidget {
  const CoinView({super.key});

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  String? coinName;

  //Получаем здесь данные для страницы
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    
    assert(args != null || args is String, 'You must provide String args');
    if (args == null || args is! String) {
      return;
    }

    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(coinName ?? "Unknown")));
  }
}
