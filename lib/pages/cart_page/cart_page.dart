import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const path = 'cart';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Cart Page')),
    );
  }
}
