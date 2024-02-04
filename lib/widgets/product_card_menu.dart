// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // final String productName;
  // final String pathToPhoto;
  final ProductCardInfo data;

  const ProductCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: SizedBox.expand(
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/food_page', arguments: data.productName);
            },
            child: Row(
              children: [
                Image.asset(data.pathToPhoto),
                const SizedBox(width: 25),
                Text(
                  data.productName,
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

class ProductCardInfo {
  final String productName;
  final String pathToPhoto;

  ProductCardInfo({
    required this.productName,
    required this.pathToPhoto,
  });
}
