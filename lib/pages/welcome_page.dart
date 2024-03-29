import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:sush_roys/theme/app_bar_theme.dart';
import '../models/shop.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String connection = 'Вперёд';
  @override
  Widget build(BuildContext context) {
    Shop shop = Provider.of<Shop>(context, listen: false);

    // Вызываем fetchMenuData
    Future<void> fetchData() async {
      await shop.fetchMenuData();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 25,
            // ),
            const Text(
              'SUSHILKA',
              style: appBarTitle,
            ),
            // const SizedBox(
            //   height: 25,
            // ),
            Image.asset(
              'assets/machine.png',
            ),
            Text(
              'ЯПОНИЯ В КАЖДОМ КУЛИНАРНОМ ШЕДЕВРЕ',
              style: TextStyle(
                fontFamily: 'Ofont',
                fontSize: 26,
                color: Colors.grey[800],
              ),
            ),
            GestureDetector(
              onTap: () async {
                bool result = await InternetConnectionChecker().hasConnection;
                // if (!mounted) return;
                if (result) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed('/home');
                } else {
                  // ignore: use_build_context_synchronously
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Кажется, нет интернета'),
                      content: const Text(
                          'Мы не сможем привезти роллы без интернета'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Проверю 5G вышку'),
                        ),
                      ],
                    ),
                  );
                  // result = await InternetConnectionChecker().hasConnection;
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.yellow),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$connection'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
