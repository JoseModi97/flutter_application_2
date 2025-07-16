import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
