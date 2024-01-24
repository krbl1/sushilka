import 'package:flutter/material.dart';
import 'package:sush_roys/components/drinks_tiles.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/drinks/drink_details.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/models/drinks.dart';
import 'package:sush_roys/models/rolls.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../theme/app_bar_theme.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  void navigateToDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DrinkDetail(
                  food: drinksMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'напитки',
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: [
          appBarActionsButton,
        ],
      ),
      body: ListView.separated(
        itemCount: drinksMenu.length,
        itemBuilder: (BuildContext context, int index) {
          // return Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       print('menu');
          //     },
          //     child: Container(
          //         height: 150,
          //         child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             // crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Image.network(
          //                 'https://edakotlas.ru/images/detailed/1/slivochnaya_california.jpg',
          //                 height: 150,
          //                 width: 150,
          //               ),
          //               SizedBox(
          //                 width: 20,
          //               ),
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Text(
          //                     'Ролл Калифорния $index',
          //                     style:
          //                         TextStyle(fontFamily: 'Verse', fontSize: 15),
          //                   ),
          //                   IconButton(
          //                       onPressed: () {},
          //                       icon: const Icon(Icons.shopping_cart_outlined)),
          //                   Text('400 г  8 шт'),
          //                 ],
          //               ),
          //             ])),
          //   ),
          // );
          return DrinksTile(
            food: drinksMenu[index],
            onTap: () => navigateToDetails(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      drawer: NavBar(),
    );
  }
}
