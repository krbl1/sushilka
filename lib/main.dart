import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/city_select_page.dart';
import 'firebase_options.dart';
import 'pages/food_page.dart';
import 'models/shop.dart';
import 'pages/welcome_page.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
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
        '/city': (context) => CitySelectionPage(),
      },
      // theme: ,
    );
  }
}
