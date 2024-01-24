import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sush_roys/theme/app_bar_theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String connection = 'Вперёд';
  @override
  Widget build(BuildContext context) {
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
            Text(
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
                  Navigator.of(context).pushNamed('/home');
                } else {
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
                  padding: EdgeInsets.all(15),
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
                        Icon(Icons.arrow_forward_ios_outlined),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
