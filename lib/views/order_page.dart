import 'package:flutter/material.dart';
import 'package:hive/components/product_list.dart';
import 'package:hive/models/product.dart';
import 'package:hive/services/product.dart';
import 'package:hive/views/inventory_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    ProductService().getProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InventoryPage(),
              ),
            ),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ProductList(products: products),
    );
  }
}
