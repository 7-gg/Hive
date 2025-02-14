import 'dart:convert';

import 'package:hive/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=10'));

      if (response.statusCode == 200) {
        final bodyJson =
            (jsonDecode(response.body) as Map).cast<String, dynamic>();
        final productsJson = bodyJson['products'] as List;

        return productsJson
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
