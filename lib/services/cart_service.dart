import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart.dart';

class CartService {
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<Cart> createCart(Cart cart) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/carts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': cart.userId,
        'products': cart.products
            .map((p) => {'productId': p.productId, 'quantity': p.quantity})
            .toList(),
      }),
    );

    if (response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create cart');
    }
  }
}
