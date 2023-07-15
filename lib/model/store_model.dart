import 'dart:collection';

import 'package:epic_clicker/model/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_model.dart';

class StoreModel extends ChangeNotifier {
  final List<Product> products = [Product("x2", 250, 2)];

  StoreModel();

  UnmodifiableListView<Product> get allProducts =>
      UnmodifiableListView(products);

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }

  void clear() {
    products.clear();
  }

  void updateProduct(Product product, int index) {
    products[index] = product;
    notifyListeners();
  }

  String? buyProduct(context, Product product, int index) {
    final isAffordable = Provider.of<CounterModel>(context, listen: false)
        .subtract(product.price);

    if (!isAffordable) {
      return "You don't have enough coins to buy ${product.name}";
    }

    product.buy(context);
    updateProduct(product, index);

    return null;
  }
}
