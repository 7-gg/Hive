import 'package:flutter/material.dart';
import 'package:hive/helpers/screen_size.dart';
import 'package:hive/models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
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
                        products[index].title,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$${products[index].price}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(products[index].category.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Stock ${products[index].stock} '),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Add to cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
