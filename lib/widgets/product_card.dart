import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String pathToPhoto;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.pathToPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: SizedBox.expand(
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/food_page', arguments: productName);
            },
            child: Row(
              children: [
                Image.asset(pathToPhoto),
                const SizedBox(width: 25),
                Text(
                  productName,
                  style: const TextStyle(fontFamily: 'Ofont', fontSize: 25),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
