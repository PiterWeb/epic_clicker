import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/store_item.dart';
import '/model/store_model.dart';
import '/model/counter_model.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    final coins = Provider.of<CounterModel>(context, listen: true).counterValue;

    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Coins: ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$coins",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Consumer<StoreModel>(
          builder: (context, store, _) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return StoreItem(
                  product: store.products[index],
                  index: index,
                );
              },
              itemCount: store.products.length,
              shrinkWrap: true,
            );
          },
        ),
      ],
    );
  }
}
