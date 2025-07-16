import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/src/product/data/models/product_model.dart';

class CartModel extends Equatable {
  final int id;
  final int userId;
  final List<ProductModel> products;

  const CartModel({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      products: (json['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, userId, products];
}
