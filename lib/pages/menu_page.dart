// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sush_roys/nav.dart';

import '../theme/app_bar_theme.dart';
import '../widgets/cart_button.dart';
import '../widgets/product_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню', style: appBarTitle),
        backgroundColor: appBarColor,
        actions: const [
          CartButtonWidget(),
        ],
      ),
      drawer: NavBar(),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ProductCard(
              productName: 'Суши',
              pathToPhoto: 'assets/nigiri.png',
            ),
            Divider(),
            ProductCard(
              productName: 'Роллы',
              pathToPhoto: 'assets/uramaki.png',
            ),
            Divider(),
            ProductCard(
              productName: 'Сеты',
              pathToPhoto: 'assets/sushi.png',
            ),
            Divider(),
            ProductCard(
              productName: 'Поке',
              pathToPhoto: 'assets/poke.png',
            ),
            Divider(),
            ProductCard(
              productName: 'Вок',
              pathToPhoto: 'assets/food.png',
            ),
            Divider(),
            ProductCard(
              productName: 'Напитки',
              pathToPhoto: 'assets/lemonade.png',
            ),
          ],
        ),
      )),
    );
  }
}
