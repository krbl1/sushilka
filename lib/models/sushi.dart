import 'dart:convert';

class Sushi {
  String name;
  double price;
  double weight;
  int quontity;
  String description;
  String imagePath;

  Sushi({
    required this.name,
    required this.price,
    required this.weight,
    required this.quontity,
    required this.description,
    required this.imagePath,
  });

  String get _name => name;
  double get _price => price;
  double get _weight => weight;
  int get _quontity => quontity;
  String get _description => description;
  String get _imagePath => imagePath;
}

List sushiMenu = [
  Sushi(
      name: 'Суши с тунцом',
      price: 350,
      weight: 400,
      quontity: 8,
      description:
          'Вкуснейшие суши со свежайшим тунцом, приготовленные по старинному рецепту Йоши Накомуро',
      imagePath:
          'https://avatars.mds.yandex.net/get-sprav-products/9685839/2a000001892088048648468f5f99c8d375cd/M_height'),
  Sushi(
      name: 'Суши с лососем',
      price: 350,
      weight: 200,
      quontity: 4,
      description:
          'Традиционные суши со свежим лососем. Попробовав однажды эти суши, вы познаёте дзэн. Данными суши можно дополнить большой сет.',
      imagePath:
          'https://static.tildacdn.com/tild3861-3032-4732-a637-616535356364/SUSHI-S-LOSOSEM1.png')
];
