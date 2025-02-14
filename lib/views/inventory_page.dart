import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive/hive_boxes.dart';
import 'package:hive/models/product.dart';
import 'package:hive_ce/hive.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    final products = Hive.box<Product>(productBox).values;
    // ..
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: products.isEmpty
          ? Center(
              child: Text('The inventory is currently empty!'),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products.toList()[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: SvgPicture.asset(
                      'assets/images/product.svg',
                      width: 25, // Width
                      height: 30, // Height
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.category as String),
                  trailing: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
