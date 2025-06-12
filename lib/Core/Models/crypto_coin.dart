import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final double priceWithUSD;
  final String imageURL;

  const CryptoCoin({
    required this.name,
    required this.priceWithUSD,
    required this.imageURL,
  });
  
  @override
  List<Object?> get props => [name, priceWithUSD, imageURL];
}
