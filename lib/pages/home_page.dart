import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/pages/food_details_page.dart';
import 'package:sush_roys/nav.dart';
import 'package:sush_roys/widgets/promo.dart';
import '../components/rols_tile.dart';
import '../models/foods.dart';
import '../models/shop.dart';
import '../theme/app_bar_theme.dart';
import '../widgets/cart_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String textToFind = '';

class _HomePageState extends State<HomePage> {
  void navigateToDetails(int index, List<Food> findMenu) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetail(
                  food: findMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodsMenuCategory = shop.foodsMenu
        .where((food) =>
            food.name
                .toString()
                .toLowerCase()
                .contains(textToFind.toLowerCase()) ||
            food.description
                .toString()
                .toLowerCase()
                .contains(textToFind.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sushilka',
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: const [
          CartButtonWidget(),
        ],
      ),
      // backgroundColor: Colors.pink[50],
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 140.0, // y
            child: ListView(scrollDirection: Axis.horizontal, children: const [
              PromoWidget(
                promoText: '-10% на первый заказ',
                pathToImage: 'assets/promo2.png',
                routePath: '/menu',
              ),
              PromoWidget(
                promoText: 'Зарегистрируйся \nи получи скидку 33%',
                pathToImage: 'assets/promo.png',
                routePath: '/menu',
              ),
            ]),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Найдите здесь...'),
                onSubmitted: (text) {
                  setState(() {
                    // print("Введенный текст: $text");

                    textToFind = text;
                  });
                },
                onChanged: (text) {
                  setState(() {
                    textToFind = text;

                    // print("Введенный текст: $text");
                  });
                }),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return FoodTile(
                  food: foodsMenuCategory[index],
                  onTap: () => navigateToDetails(index, foodsMenuCategory),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: foodsMenuCategory.length,
            ),
          )
        ],
      ),
      drawer: NavBar(),
    );
  }
}
