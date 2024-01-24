import 'dart:convert';

class Drinks {
  String name;
  double price;
  double weight;

  String description;
  String imagePath;

  Drinks({
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imagePath,
  });

  String get _name => name;
  double get _price => price;
  double get _weight => weight;

  String get _description => description;
  String get _imagePath => imagePath;
}

List drinksMenu = [
  Drinks(
      name: 'Яблочный сок',
      price: 100,
      weight: 1000,
      description: 'Свежевыжитый яблочный сок',
      imagePath:
          'https://static.tildacdn.com/tild3563-3564-4134-b031-386463356537/photo.jpg'),
  Drinks(
      name: 'Кола',
      price: 200,
      weight: 400,
      description: 'Добрый Кола',
      imagePath:
          'https://static.tildacdn.com/stor6265-3635-4137-b637-633936663833/48356279.png'),
  Drinks(
      name: 'Фанта',
      price: 200,
      weight: 400,
      description: 'Добрый Апельсин',
      imagePath:
          'https://vendliga.ru/upload/resize_cache/iblock/f91/1200_1200_140cd750bba9870f18aada2478b24840a/pdzny56pcu2waz0v5fm300530c2hwxmu.png')
];
