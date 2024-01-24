import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NavBar extends StatelessWidget {
  checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                // color: Colors.blue,

                ),
            child: Image.asset('assets/machine.png'),
          ),
          ListTile(
            leading: Image.asset('assets/home.png'),
            title: const Text('Главное меню'),
            // selected: _selectedIndex == 0,
            onTap: () {
              // Update the state of the app
              // _onItemTapped(0);
              // Then close the drawer
              Navigator.of(context).pushNamed('/home');
            },
          ),
          Divider(),
          ListTile(
            leading: Image.asset('assets/menu.png'),
            title: const Text('Меню'),
            // selected: _selectedIndex == 1,
            onTap: () {
              // Update the state of the app
              // _onItemTapped(1);
              // Then close the drawer
              Navigator.of(context).pushNamed('/menu');
              // Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Image.asset('assets/place.png'),
            title: const Text('Мой город'),
            // selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              // _onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
