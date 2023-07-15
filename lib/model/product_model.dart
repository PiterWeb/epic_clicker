import 'package:provider/provider.dart';

import 'counter_model.dart';

class Product {
  final String name;
  int price;
  final double multiplier;

  Product(this.name, this.price, this.multiplier);

  get getName => name;
  get getPrice => price;

  void buy(context) {
    price = (price * 2.5).ceil();
    final counter = Provider.of<CounterModel>(context, listen: false);
    counter.concatMultiplier(multiplier);
  }
}
