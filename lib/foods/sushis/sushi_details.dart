import 'package:flutter/material.dart';
import 'package:sush_roys/models/sushi.dart';

import '../../models/rolls.dart';

class SushiDetails extends StatefulWidget {
  final Sushi food;

  const SushiDetails({super.key, required this.food});

  @override
  State<SushiDetails> createState() => _SushiDetailsState();
}

class _SushiDetailsState extends State<SushiDetails> {
  int quontityCount = 0;

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
                    onTap: () {},
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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chevron_right_sharp)),
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
