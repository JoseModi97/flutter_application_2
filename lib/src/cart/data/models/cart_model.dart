import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/src/cart/data/models/cart_item_model.dart';

class CartModel extends Equatable {
  final int id;
  final int userId;
  final List<CartItemModel> items;

  const CartModel({
    required this.id,
    required this.userId,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, userId, items];
}
