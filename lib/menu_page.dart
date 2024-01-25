import 'package:flutter/material.dart';
import 'package:sush_roys/nav.dart';
import 'theme/app_bar_theme.dart';

// import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню', style: appBarTitle),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/sushi');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/nigiri.png'),
                        SizedBox(width: 25),
                        Text(
                          'Суши',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/rolls');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/uramaki.png'),
                        SizedBox(width: 25),
                        Text(
                          'Роллы',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/sets');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/sushi.png'),
                        SizedBox(width: 25),
                        Text(
                          'Сеты',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/poke');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/poke.png'),
                        SizedBox(width: 25),
                        Text(
                          'Поке',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/wok');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/food.png'),
                        SizedBox(width: 25),
                        Text(
                          'WOK',
                          style: TextStyle(fontFamily: 'Verse', fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/drinks');
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/lemonade.png'),
                        SizedBox(width: 25),
                        Text(
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
