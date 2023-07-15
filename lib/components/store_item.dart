import 'package:flutter/material.dart';
import '/model/product_model.dart';
import '/model/store_model.dart';

class StoreItem extends StatefulWidget {
  const StoreItem({
    super.key,
    required this.product,
    required this.index,
  });

  final Product product;
  final int index;

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Text(
                "${widget.product.getName}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 55)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                iconColor: const MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                final err = StoreModel()
                    .buyProduct(context, widget.product, widget.index);

                if (err == null) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(err),
                    duration: const Duration(milliseconds: 600),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart, size: 30),
              label: Text(
                "${widget.product.getPrice}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
