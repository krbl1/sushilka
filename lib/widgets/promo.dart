// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  final String promoText;
  final String pathToImage;
  final String routePath;

  const PromoWidget({
    Key? key,
    required this.promoText,
    required this.pathToImage,
    required this.routePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(routePath),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.all(15),
        // child: Text('data'),

        child: Row(
          // mainAxisAlignment: MainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  promoText,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 15, fontFamily: "Ofont"),
                ),
                const Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Перейти'),
                      Icon(Icons.chevron_right_sharp),
                    ]),
              ],
            ),
            const SizedBox(width: 50),
            Image.asset(
              pathToImage,
              height: 120,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}
