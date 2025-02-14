import 'package:flutter/material.dart';
import 'package:hive/helpers/screen_size.dart';
import 'package:hive/hive/hive_boxes.dart';
import 'package:hive/models/product.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Product>>(
      valueListenable: Hive.box<Product>(productBox).listenable(),
      builder: (BuildContext context, Box<Product> box, Widget? _) =>
          ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = Product.fromJson(products[index].toJson());
          // ..
          final matchingProduct = box.values.where((Product existingProduct) {
            return existingProduct.id == product.id;
          }).firstOrNull;
          // ..
          final isReceived = matchingProduct != null;
          // ..
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: ScreenSize.getWidth(context) * 0.6,
                        child: Text(
                          product.title,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(product.category.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Stock ${product.stock} '),
                      TextButton(
                        onPressed: isReceived ? null : () => box.add(product),
                        child: isReceived
                            ? const Text('Received')
                            : const Text('Add to cart'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
