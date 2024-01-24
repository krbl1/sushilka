import 'package:flutter/material.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/models/foods.dart';
import 'package:sush_roys/nav.dart';
import 'roll_details.dart';

import '../../theme/app_bar_theme.dart';

class RollsPage extends StatefulWidget {
  const RollsPage({super.key});

  @override
  State<RollsPage> createState() => _RollsPageState();
}

class _RollsPageState extends State<RollsPage> {
  void navigateToDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetail(
                  food: foodsMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'роллы',
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: [
          appBarActionsButton,
        ],
      ),
      body: ListView.separated(
        itemCount: foodsMenu.length,
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
          return RollTile(
            food: foodsMenu[index],
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
