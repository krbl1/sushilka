import 'package:flutter/material.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/components/sets_tiles.dart';
import 'package:sush_roys/foods/rolls/roll_details.dart';
import 'package:sush_roys/foods/sets/set_details.dart';
import 'package:sush_roys/models/foods.dart';
import 'package:sush_roys/models/sets.dart';
import 'package:sush_roys/nav.dart';
// import 'roll_details.dart';

import '../../theme/app_bar_theme.dart';

class SetsPage extends StatefulWidget {
  const SetsPage({super.key});

  @override
  State<SetsPage> createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  void navigateToDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SetsDetail(
                  food: foodsMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'сеты',
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
          return SetsTile(
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
