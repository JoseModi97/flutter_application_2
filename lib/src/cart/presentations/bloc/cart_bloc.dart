import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/src/cart/data/models/cart_item_model.dart';
import 'package:flutter_application_2/src/cart/presentations/bloc/cart_event.dart';
import 'package:flutter_application_2/src/cart/presentations/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final existingItemIndex = currentState.items
          .indexWhere((item) => item.product.id == event.product.id);
      if (existingItemIndex != -1) {
        final updatedItems = List<CartItemModel>.from(currentState.items);
        final existingItem = updatedItems[existingItemIndex];
        if (existingItem.quantity < existingItem.product.inventory) {
          updatedItems[existingItemIndex] = CartItemModel(
            product: existingItem.product,
            quantity: existingItem.quantity + 1,
          );
          emit(CartLoaded(updatedItems));
        }
      } else {
        if (event.product.inventory > 0) {
          final updatedItems = List<CartItemModel>.from(currentState.items)
            ..add(CartItemModel(product: event.product, quantity: 1));
          emit(CartLoaded(updatedItems));
        }
      }
    } else {
      if (event.product.inventory > 0) {
        emit(CartLoaded([CartItemModel(product: event.product, quantity: 1)]));
      }
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = currentState.items
          .where((item) => item.product.id != event.productId)
          .toList();
      emit(CartLoaded(updatedItems));
    }
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = List<CartItemModel>.from(currentState.items);
      final itemIndex =
          updatedItems.indexWhere((item) => item.product.id == event.productId);
      if (itemIndex != -1) {
        final item = updatedItems[itemIndex];
        if (event.quantity > 0 && event.quantity <= item.product.inventory) {
          updatedItems[itemIndex] = CartItemModel(
            product: item.product,
            quantity: event.quantity,
          );
          emit(CartLoaded(updatedItems));
        }
      }
    }
  }
}
