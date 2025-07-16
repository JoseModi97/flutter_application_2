import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cart_viewmodel.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartViewModel.products.length,
              itemBuilder: (context, index) {
                final product = cartViewModel.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Assume userId is 1 for now
              cartViewModel.createCart(1);
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
