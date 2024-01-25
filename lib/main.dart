import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/cart_page.dart';
import 'package:sush_roys/foods/drinks/drinks_page.dart';
import 'package:sush_roys/foods/pokes/pokes_page.dart';
import 'package:sush_roys/foods/rolls/rolls_page.dart';
import 'package:sush_roys/foods/sets/sets_page.dart';
import 'package:sush_roys/foods/sushis/sushi_page.dart';
import 'package:sush_roys/foods/woks/woks_page.dart';
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
        '/rolls': (context) => const RollsPage(),
        '/sushi': (context) => const SushiPage(),
        '/poke': (context) => const PokesPage(),
        '/drinks': (context) => const DrinksPage(),
        '/sets': (context) => const SetsPage(),
        '/wok': (context) => const WoksPage(),
        '/cart': (context) => const CartPage(),
      },
      // theme: ,
    );
  }
}
