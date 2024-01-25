import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/foods.dart';
import '../../models/shop.dart';

class FoodDetail extends StatefulWidget {
  final Food food;

  const FoodDetail({super.key, required this.food});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quontityCount = 1;

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
                icon: Icon(Icons.done)),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
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
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  '${widget.food.name}',
                  style: TextStyle(fontFamily: 'Verse', fontSize: 30),
                ),
                Row(
                  children: [
                    Text(
                      '${widget.food.weight.toInt()} г ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Image.asset(
                      'assets/measurement.png',
                      height: 20,
                      width: 20,
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
                  '${widget.food.description}',
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
                            decoration: BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                            child: IconButton(
                              icon: Icon(Icons.remove),
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
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                          // SizedBox(
                          //   width: 7,
                          // ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                            child: IconButton(
                              icon: Icon(Icons.add),
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
                      padding: EdgeInsets.all(5),
                      child: Row(
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
    );
  }
}
