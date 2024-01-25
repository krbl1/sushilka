import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sush_roys/menu_page.dart';
import 'package:sush_roys/nav.dart';
// import 'internet_dialog.dart';
import 'theme/app_bar_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sushilka',
          style: appBarTitle,
        ),
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
      // backgroundColor: Colors.pink[50],
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            // width: MediaQuery.of(context)
            //     .size
            //     .width, // This will make your list fill the screen horizontally
            height: 140.0, // y
            child: ListView(scrollDirection: Axis.horizontal, children: [
              GestureDetector(
                onTap: () {
                  print('menu');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(15),
                  // child: Text('data'),
                  // child: GestureDetector(

                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Зарегистрируйся \nи получи скидку 33%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Verse"),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Перейти'),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.chevron_right_sharp)),
                              ]),
                        ],
                      ),
                      SizedBox(width: 50),
                      Image.asset(
                        'assets/promo.png',
                        height: 120,
                        width: 120,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('menu');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(15),
                  // child: Text('data'),

                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '-10% на первый заказ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Verse"),
                          ),
                          Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Перейти'),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.chevron_right_sharp)),
                              ]),
                        ],
                      ),
                      SizedBox(width: 50),
                      Image.asset(
                        'assets/promo2.png',
                        height: 120,
                        width: 120,
                      )
                    ],
                  ),
                ),
              ),
            ]
                // Your itemBuilder code here
                ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Найдите здесь...'),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
      drawer: NavBar(),
    );
  }
}
