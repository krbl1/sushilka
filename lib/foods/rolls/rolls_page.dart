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
  List rollsMenu = foodsMenu.where((food) => food.category == 'Роллы').toList();

  void navigateToDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetail(
                  food: rollsMenu[index],
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
