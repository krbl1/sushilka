import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/models/shop.dart';
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
    final shop = context.read<Shop>();
    final rollsMenu =
        shop.foodsMenu.where((food) => food.category == 'Роллы').toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetail(
                  food: rollsMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final rollsMenu =
        shop.foodsMenu.where((food) => food.category == 'Роллы').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'роллы',
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: ListView.separated(
        itemCount: rollsMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return RollTile(
            food: rollsMenu[index],
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
