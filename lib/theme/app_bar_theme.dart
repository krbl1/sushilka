import 'package:flutter/material.dart';
import 'package:sush_roys/menu_page.dart';

const appBarColor = Colors.yellow;
const appBarTitle = TextStyle(fontFamily: 'Verse', fontSize: 35);
// Container appBarLeadingButton = Container(
//   child: GestureDetector(
//     onTap: () {Navigator.of(context).push(
// MaterialPageRoute( builder: (context) => MenuPage(),
// ),
//     );

// // MaterialPageRoute
//     },
//     child: Image.asset(
//       'assets/bars-staggered.png',
//       height: 30,
//       width: 30,
//     ),
//   ),
// );

IconButton appBarActionsButton = IconButton(
    onPressed: () {
      MenuPage();
    },
    icon: const Icon(
      Icons.shopping_cart_outlined,
      color: Colors.black,
      size: 30,
    ));
