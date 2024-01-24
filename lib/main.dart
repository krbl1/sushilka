import 'package:flutter/material.dart';
import 'package:sush_roys/foods/drinks/drinks_page.dart';
import 'package:sush_roys/foods/pokes/pokes_page.dart';
import 'package:sush_roys/foods/rolls/rolls_page.dart';
import 'package:sush_roys/foods/sets/sets_page.dart';
import 'package:sush_roys/foods/sushis/sushi_page.dart';
import 'package:sush_roys/foods/woks/woks_page.dart';
import 'package:sush_roys/welcome_page.dart';
import 'home_page.dart';
import 'menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => HomePage(),
        '/menu': (context) => MenuPage(),
        '/rolls': (context) => RollsPage(),
        '/sushi': (context) => SushiPage(),
        '/poke': (context) => PokesPage(),
        '/drinks': (context) => DrinksPage(),
        '/sets': (context) => SetsPage(),
        '/wok': (context) => WoksPage(),
      },
      // theme: ,
    );
  }
}
