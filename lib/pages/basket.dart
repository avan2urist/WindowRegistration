import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems;

  const CartPage(this.cartItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]),
            // Добавь другие детали товара, если необходимо
          );
        },
      ),
    );
  }
}