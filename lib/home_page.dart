import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/food_details.dart';
import 'package:sush_roys/nav.dart';
import 'components/rols_tile.dart';
import 'models/foods.dart';
import 'models/shop.dart';
import 'theme/app_bar_theme.dart';

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
    final poke = [1, 2, 4, 5, 23];
    final shop = context.read<Shop>();
    final _foodsMenuCategory = shop.foodsMenu
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
    print(textToFind);
    print(_foodsMenuCategory.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sushilka',
          style: appBarTitle,
        ),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart'),
              icon: const Icon(Icons.shopping_cart)),
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
                onTap: () => Navigator.of(context).pushNamed('/menu'),
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
                      const Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '-10% на первый заказ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Ofont"),
                          ),
                          Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Перейти'),
                                Icon(Icons.chevron_right_sharp),
                              ]),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Image.asset(
                        'assets/promo2.png',
                        height: 120,
                        width: 120,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
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
                          const Text(
                            'Зарегистрируйся \nи получи скидку 33%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Ofont"),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Перейти'),
                                IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.chevron_right_sharp)),
                              ]),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Image.asset(
                        'assets/promo.png',
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
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Найдите здесь...'),
                onSubmitted: (text) {
                  setState(() {
                    print("Введенный текст: $text");

                    textToFind = text;
                  });
                },
                onChanged: (text) {
                  setState(() {
                    textToFind = text;

                    print("Введенный текст: $text");
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
                  food: _foodsMenuCategory[index],
                  onTap: () => navigateToDetails(index, _foodsMenuCategory),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: _foodsMenuCategory.length,
            ),
          )
        ],
      ),
      drawer: NavBar(),
    );
  }
}
