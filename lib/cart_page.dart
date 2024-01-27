import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/models/shop.dart';
import 'package:sush_roys/theme/app_bar_theme.dart';

import 'models/foods.dart';
import 'nav.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Корзина',
            style: appBarTitle,
          ),
          backgroundColor: appBarColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    final Food food = value.cart[index];
                    final String foodName = food.name;

                    final String foodPrice = food.price.toInt().toString();
                    final String pathToImage = food.imagePath;

                    return ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('$foodPrice Р'),
                      leading: Image.network(
                        pathToImage,
                        height: 300,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const CircularProgressIndicator(
                            color: Colors.yellow,
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/networking.png');
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.yellow),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Оформить заказ'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ])),
            ),
          ],
        ),
        drawer: NavBar(),
      );
    });
  }
}
