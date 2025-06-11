import 'package:crypto_coins/Core/MainScreen/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final _listBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _listBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _listBloc,
        builder: (context, state) {
          if(state is CryptoListLoaded) {
           return ListView.separated(
            padding: EdgeInsets.only(top: 16),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.coinsList.length, //Кол-во ячеек
            itemBuilder: (context, index) {
              final coin = state.coinsList[index]; //достаем монету из массива
              return Cell(coin: coin);
            },
          );
          }
          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Text("Something is wrong",
             
              ),
              );
          }
          return const Center(child: CircularProgressIndicator()); //если массив пуст показать Progress
        },
      ),
    );
  }
}
