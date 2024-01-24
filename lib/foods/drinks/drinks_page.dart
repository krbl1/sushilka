import 'package:flutter/material.dart';
import 'package:sush_roys/components/drinks_tiles.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/drinks/drink_details.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/models/foods.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../theme/app_bar_theme.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  List drinksMenu =
      foodsMenu.where((food) => food.category == 'Напитки').toList();

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
