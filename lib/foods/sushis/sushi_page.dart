import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../models/shop.dart';
import '../../theme/app_bar_theme.dart';

class SushiPage extends StatefulWidget {
  const SushiPage({super.key});

  @override
  State<SushiPage> createState() => _SushiPageState();
}

class _SushiPageState extends State<SushiPage> {
  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final sushiesMenu =
        shop.foodsMenu.where((food) => food.category == 'Суши').toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetail(
                  food: sushiesMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final sushiesMenu =
        shop.foodsMenu.where((food) => food.category == 'Суши').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Суши',
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
        itemCount: sushiesMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return RollTile(
            food: sushiesMenu[index],
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
