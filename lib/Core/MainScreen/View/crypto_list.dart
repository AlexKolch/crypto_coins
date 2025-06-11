import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../NetworkServices/crypto_coins.dart';
import 'Exports/widgets.dart';

class CryptoListView extends StatefulWidget {
  const CryptoListView({super.key});

  final String title = 'Crypto coins';

  @override
  State<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends State<CryptoListView> {
  List<CryptoCoin>? _coinsList;

  @override
  void initState() {
    _loadCoins();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:
          (_coinsList == null)
              ? //если массив пуст показать Progress, в противном ListView
              const Center(child: CircularProgressIndicator())
              : ListView.separated(
                padding: EdgeInsets.only(top: 16),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: _coinsList!.length, //Кол-во ячеек
                itemBuilder: (context, index) {
                  final coin = _coinsList![index]; //достаем монету из массива
                  return Cell(coin: coin);
                },
              ),
    );
  }

  Future<void> _loadCoins() async {
     _coinsList = await GetIt.I<AbstractCoinsRepository>().getCoins();
    setState(() {}); //это заменить потом
  }
}
