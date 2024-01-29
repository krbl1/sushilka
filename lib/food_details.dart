import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/foods.dart';
import 'models/shop.dart';
import 'nav.dart';

class FoodDetail extends StatefulWidget {
  final Food food;

  const FoodDetail({super.key, required this.food});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quontityCount = 1;
  String? _weightText;
  String? _quantText;

  @override
  void didChangeDependencies() {
    if (widget.food.category == 'Напитки') {
      _weightText = '${widget.food.weight.toInt()} мл  ';
    } else {
      _weightText = '${widget.food.weight.toInt()} г  ';
    }
    if (widget.food.category == 'Роллы' ||
        widget.food.category == 'Суши' ||
        widget.food.category == 'Сеты') {
      _quantText = ' В порции ${widget.food.quontity.toInt()} шт  ';
    } else {
      _quantText = '';
    }
    setState(() {});

    super.didChangeDependencies();
  }

  void decrementQuontity() {
    setState(() {
      if (quontityCount > 0) {
        quontityCount--;
      }
    });
  }

  void incrementQuontity() {
    setState(() {
      quontityCount++;
    });
  }

  void addToCart() {
    if (quontityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quontityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text(
            'Успешно добавлено',
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.done)),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // String _weightText = '${widget.food.weight.toInt()} г ';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart'),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                Image.network(
                  widget.food.imagePath,
                  height: 300,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const CircularProgressIndicator(
                      color: Colors.yellow,
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('assets/networking.png');
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  widget.food.name,
                  style: const TextStyle(fontFamily: 'Ofont', fontSize: 30),
                ),
                Row(
                  children: [
                    Text(
                      _weightText.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    Image.asset(
                      'assets/measurement.png',
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      _quantText.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Описание',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.food.description,
                  style: TextStyle(color: Colors.grey[700], height: 2),
                )
              ],
            ),
          )),
          Container(
              color: Colors.yellow[300],
              padding: const EdgeInsets.all(25),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.food.price.toInt()}',
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                            ),
                          ),
                          Image.asset(
                            'assets/cash.png',
                            height: 20,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: decrementQuontity,
                            ),
                          ),
                          // SizedBox(
                          //   width: 7,
                          // ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text('${quontityCount.toString()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                          // SizedBox(
                          //   width: 7,
                          // ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: incrementQuontity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: addToCart,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.all(15),
                      child: const Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('В корзину'),
                            Icon(Icons.chevron_right_sharp),
                          ]),
                    ),
                  ),
                ],
              )),
        ],
      ),
      drawer: NavBar(),
    );
  }
}
