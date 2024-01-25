import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/nav.dart';

import '../../models/shop.dart';
import '../../theme/app_bar_theme.dart';

class SetsPage extends StatefulWidget {
  const SetsPage({super.key});

  @override
  State<SetsPage> createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final setsMenu =
        shop.foodsMenu.where((food) => food.category == 'Сеты').toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetail(
                  food: setsMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final setsMenu =
        shop.foodsMenu.where((food) => food.category == 'Сеты').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'сеты',
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
        itemCount: setsMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return RollTile(
            food: setsMenu[index],
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
