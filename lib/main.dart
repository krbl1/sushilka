import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/cart_page.dart';
import 'package:sush_roys/food_page.dart';

import 'package:sush_roys/models/shop.dart';
import 'package:sush_roys/welcome_page.dart';
import 'home_page.dart';
import 'menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),

      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/menu': (context) => const MenuPage(),
        '/food_page': (context) => const FoodPage(),
        '/cart': (context) => const CartPage(),
      },
      // theme: ,
    );
  }
}
