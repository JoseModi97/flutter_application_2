import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/src/cart/data/models/cart_item_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;

  const CartLoaded(this.items);

  @override
  List<Object> get props => [items];
}
