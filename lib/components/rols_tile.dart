import 'package:flutter/material.dart';

import '../models/foods.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String _weightText = '${food.weight.toInt()} г  ${food.quontity} шт';

    if (food.category == 'Вок' || food.category == 'Поке') {
      _weightText = '${food.weight.toInt()} г  ';
    } else if (food.category == 'Напитки') {
      _weightText = '${food.weight.toInt()} мл  ';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 150,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    food.imagePath,
                    height: 150,
                    width: 150,
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
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(fontFamily: 'Ofont', fontSize: 15),
                      ),
                      IconButton(
                          onPressed: onTap,
                          icon: const Icon(Icons.shopping_cart_outlined)),
                      Text(_weightText),
                    ],
                  ),
                ])),
      ),
    );
  }
}
