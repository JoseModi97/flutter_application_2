import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../services/cart_service.dart';
import '../models/product.dart';

class CartViewModel extends ChangeNotifier {
  final CartService _cartService = CartService();

  Cart? _cart;
  Cart? get cart => _cart;

  final List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  Future<void> createCart(int userId) async {
    _isLoading = true;
    notifyListeners();

    final cartItems = _products
        .map((p) => CartItem(productId: p.id, quantity: 1))
        .toList();
    final newCart = Cart(id: 0, userId: userId, products: cartItems);

    _cart = await _cartService.createCart(newCart);

    _isLoading = false;
    notifyListeners();
  }
}
