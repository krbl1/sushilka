import 'package:flutter/material.dart';
import 'package:sush_roys/components/pokes_liles.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/foods/pokes/poke_details.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/foods/woks/wok_details.dart';
import 'package:sush_roys/models/foods.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../theme/app_bar_theme.dart';

class PokesPage extends StatefulWidget {
  const PokesPage({super.key});

  @override
  State<PokesPage> createState() => _PokesPageState();
}

class _PokesPageState extends State<PokesPage> {
  List pokesMenu = foodsMenu.where((food) => food.category == 'Поке').toList();

  void navigateToDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WokDetail(
                  food: pokesMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'поке',
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: [
          appBarActionsButton,
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
