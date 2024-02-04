// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sush_roys/nav.dart';

import '../theme/app_bar_theme.dart';
import '../widgets/cart_button.dart';
import '../widgets/product_card_menu.dart';

List<ProductCardInfo> productList = [
  ProductCardInfo(productName: 'Суши', pathToPhoto: 'assets/nigiri.png'),
  ProductCardInfo(productName: 'Роллы', pathToPhoto: 'assets/uramaki.png'),
  ProductCardInfo(productName: 'Сеты', pathToPhoto: 'assets/sushi.png'),
  ProductCardInfo(productName: 'Поке', pathToPhoto: 'assets/poke.png'),
  ProductCardInfo(productName: 'Вок', pathToPhoto: 'assets/food.png'),
  ProductCardInfo(productName: 'Напитки', pathToPhoto: 'assets/lemonade.png'),
];

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
      drawer: const NavBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: productList.map((data) => ProductCard(data: data)).toList(),
        ),
      )),
    );
  }
}
