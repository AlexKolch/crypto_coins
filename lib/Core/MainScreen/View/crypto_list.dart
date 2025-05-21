import 'package:flutter/material.dart';
import 'Exports/widgets.dart';

class CryptoListView extends StatefulWidget {
  const CryptoListView({super.key});

  final String title = 'Crypto coins';

  @override
  State<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends State<CryptoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10, //Кол-во ячеек
        itemBuilder: (context, index) {
          const coinName = 'Bitcoin';
          return const Cell(coinName: coinName);
        },
      ),
    );
  }
}

