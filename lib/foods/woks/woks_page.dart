import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/components/woks_tile.dart';
import 'package:sush_roys/foods/pokes/poke_details.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
// import 'package:sush_roys/foods/woks/wok_details.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../models/shop.dart';
import '../../theme/app_bar_theme.dart';

class WoksPage extends StatefulWidget {
  const WoksPage({super.key});

  @override
  State<WoksPage> createState() => _WoksPageState();
}

class _WoksPageState extends State<WoksPage> {
  // List woksMenu = foodsMenu.where((food) => food.category == 'Вок').toList();

  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final woksMenu =
        shop.foodsMenu.where((food) => food.category == 'Вок').toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokeDetail(
                  food: woksMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final woksMenu =
        shop.foodsMenu.where((food) => food.category == 'Вок').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'wok',
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
        itemCount: woksMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return WoksTile(
            food: woksMenu[index],
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
