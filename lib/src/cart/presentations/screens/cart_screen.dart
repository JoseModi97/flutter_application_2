import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/src/cart/presentations/bloc/cart_bloc.dart';
import 'package:flutter_application_2/src/cart/presentations/bloc/cart_event.dart';
import 'package:flutter_application_2/src/cart/presentations/bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return const Center(
                child: Text('Your cart is empty'),
              );
            }
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  leading: Image.network(item.product.image),
                  title: Text(item.product.title),
                  subtitle: Text('\$${item.product.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (item.quantity > 1) {
                            context.read<CartBloc>().add(
                                  UpdateQuantity(
                                    item.product.id,
                                    item.quantity - 1,
                                  ),
                                );
                          } else {
                            context
                                .read<CartBloc>()
                                .add(RemoveFromCart(item.product.id));
                          }
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          context.read<CartBloc>().add(
                                UpdateQuantity(
                                  item.product.id,
                                  item.quantity + 1,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Your cart is empty'),
          );
        },
      ),
    );
  }
}
