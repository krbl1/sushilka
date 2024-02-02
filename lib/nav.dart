import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('assets/machine.png'),
          ),
          ListTile(
            leading: Image.asset('assets/home.png'),
            title: const Text('Главное меню'),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset('assets/menu.png'),
            title: const Text('Меню'),
            onTap: () {
              Navigator.of(context).pushNamed('/menu');
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset('assets/place.png'),
            title: const Text('Мой город'),
            onTap: () {
              Navigator.of(context).pushNamed('/city');
            },
          ),
        ],
      ),
    );
  }
}
