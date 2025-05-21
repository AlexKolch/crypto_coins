import 'package:flutter/material.dart';

class CoinDetailView extends StatefulWidget {
  const CoinDetailView({super.key});

  @override
  State<CoinDetailView> createState() => _CoinDetailViewState();
}

class _CoinDetailViewState extends State<CoinDetailView> {
  String? coinName;

  @override //Получаем здесь данные для страницы
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