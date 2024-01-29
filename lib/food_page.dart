import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/components/rols_tile.dart';
import 'package:sush_roys/food_details.dart';
import 'package:sush_roys/models/shop.dart';
import 'package:sush_roys/nav.dart';
import 'theme/app_bar_theme.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  String? categoryName;

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments == null) {
      return;
    }
    categoryName = arguments.toString();
    setState(() {});
    super.didChangeDependencies();
  }

  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final rollsMenu =
        shop.foodsMenu.where((food) => food.category == categoryName).toList();

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
    final foodsMenuCategory =
        shop.foodsMenu.where((food) => food.category == categoryName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName.toString(),
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart'),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: ListView.separated(
        itemCount: foodsMenuCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodTile(
            food: foodsMenuCategory[index],
            onTap: () => navigateToDetails(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
      drawer: NavBar(),
    );
  }
}
