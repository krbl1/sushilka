import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/pokes_tiles.dart';
import 'package:sush_roys/foods/pokes/poke_details.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../models/shop.dart';
import '../../theme/app_bar_theme.dart';

class PokesPage extends StatefulWidget {
  const PokesPage({super.key});

  @override
  State<PokesPage> createState() => _PokesPageState();
}

class _PokesPageState extends State<PokesPage> {
  // List pokesMenu = foodsMenu.where((food) => food.category == 'Поке').toList();

  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final pokesMenu =
        shop.foodsMenu.where((food) => food.category == 'Поке').toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokeDetail(
                  food: pokesMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final pokesMenu =
        shop.foodsMenu.where((food) => food.category == 'Поке').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'поке',
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
        itemCount: pokesMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return PokesTile(
            food: pokesMenu[index],
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
