import 'product.dart';

class Cart {
  final int id;
  final int userId;
  final List<CartItem> products;

  Cart({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as List;
    List<CartItem> productsList =
        productsJson.map((i) => CartItem.fromJson(i)).toList();

    return Cart(
      id: json['id'],
      userId: json['userId'],
      products: productsList,
    );
  }
}

class CartItem {
  final int productId;
  final int quantity;

  CartItem({
    required this.productId,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
