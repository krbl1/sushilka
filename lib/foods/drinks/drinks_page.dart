import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/drinks_tiles.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/drinks/drink_details.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/nav.dart';

import '../../models/shop.dart';
import '../../theme/app_bar_theme.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  // List drinksMenu =
  //     foodsMenu.where((food) => food.category == 'Напитки').toList();

  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final drinksMenu =
        shop.foodsMenu.where((food) => food.category == 'Напитки').toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DrinkDetail(
                  food: drinksMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final drinksMenu =
        shop.foodsMenu.where((food) => food.category == 'Напитки').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'напитки',
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
        itemCount: drinksMenu.length,
        itemBuilder: (BuildContext context, int index) {
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
