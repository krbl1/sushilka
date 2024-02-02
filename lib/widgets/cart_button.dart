import 'package:flutter/material.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pushNamed('/cart'),
        icon: const Icon(Icons.shopping_cart));
  }
}
