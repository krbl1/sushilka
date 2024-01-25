import 'package:flutter/material.dart';

import '../models/foods.dart';

class PokesTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const PokesTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(fontFamily: 'Verse', fontSize: 15),
                      ),
                      IconButton(
                          onPressed: onTap,
                          icon: const Icon(Icons.shopping_cart_outlined)),
                      Text('${food.weight.toInt()} г  '),
                    ],
                  ),
                ])),
      ),
    );
  }
}
