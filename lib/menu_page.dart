import 'package:flutter/material.dart';
import 'package:sush_roys/nav.dart';
import 'theme/app_bar_theme.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню', style: appBarTitle),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart'),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/food_page', arguments: 'Суши');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/nigiri.png'),
                        const SizedBox(width: 25),
                        const Text(
                          'Суши',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/food_page', arguments: 'Роллы');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/uramaki.png'),
                        const SizedBox(width: 25),
                        const Text(
                          'Роллы',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/food_page', arguments: 'Сеты');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/sushi.png'),
                        const SizedBox(width: 25),
                        const Text(
                          'Сеты',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/food_page', arguments: 'Поке');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/poke.png'),
                        const SizedBox(width: 25),
                        const Text(
                          'Поке',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/food_page', arguments: 'Вок');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/food.png'),
                        const SizedBox(width: 25),
                        const Text(
                          'WOK',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/food_page', arguments: 'Напитки');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/lemonade.png'),
                        const SizedBox(width: 25),
                        const Text(
                          'Напитки',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      drawer: NavBar(),
    );
  }
}
