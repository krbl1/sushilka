import 'dart:convert';

class Food {
  String category;
  String name;
  double price;
  double weight;
  int quontity;
  String description;
  String imagePath;

  Food({
    required this.category,
    required this.name,
    required this.price,
    required this.weight,
    required this.quontity,
    required this.description,
    required this.imagePath,
  });

  String get _category => category;
  String get _name => name;
  double get _price => price;
  double get _weight => weight;
  int get _quontity => quontity;
  String get _description => description;
  String get _imagePath => imagePath;
}

List foodsMenu = [
  Food(
      category: 'Роллы',
      name: 'Филадельфия',
      price: 350,
      weight: 400,
      quontity: 8,
      description:
          'Вкуснейшие роллы со свежайшим лососем, приготовленные по старинному рецепту Йоши Накомуро',
      imagePath:
          'https://foodband.ru/wp-content/uploads/2016/09/1466-original-1692290368.jpg'),
  Food(
      category: 'Сеты',
      name: 'Сет Кукан',
      price: 1500,
      weight: 2000,
      quontity: 72,
      description:
          'Сет на большую компанию. Приготовллен с огоньком, так что берегите свой кукан. Состав: Ролл Кривой, Ролл Сырой, Ролл Вкусный, Ролл Калифорния',
      imagePath:
          'https://thapl-public.storage.yandexcloud.net/thapl-project415/img/CatalogItem/4537fcf43ba98a245502b8ce4f45eb54_thumb_50_1458_1458.jpg'),
  Food(
      category: 'Напитки',
      name: 'Яблочный сок',
      price: 100,
      weight: 1000,
      quontity: 1,
      description: 'Свежевыжитый яблочный сок',
      imagePath:
          'https://static.tildacdn.com/tild3563-3564-4134-b031-386463356537/photo.jpg'),
  Food(
      category: 'Напитки',
      name: 'Кола',
      price: 200,
      weight: 400,
      quontity: 1,
      description: 'Добрый Кола',
      imagePath:
          'https://static.tildacdn.com/stor6265-3635-4137-b637-633936663833/48356279.png'),
  Food(
      category: 'Напитки',
      name: 'Фанта',
      price: 200,
      weight: 400,
      quontity: 1,
      description: 'Добрый Апельсин',
      imagePath:
          'https://vendliga.ru/upload/resize_cache/iblock/f91/1200_1200_140cd750bba9870f18aada2478b24840a/pdzny56pcu2waz0v5fm300530c2hwxmu.png'),
  Food(
      category: 'Суши',
      name: 'Суши с тунцом',
      price: 350,
      weight: 400,
      quontity: 8,
      description:
          'Вкуснейшие суши со свежайшим тунцом, приготовленные по старинному рецепту Йоши Накомуро',
      imagePath:
          'https://avatars.mds.yandex.net/get-sprav-products/9685839/2a000001892088048648468f5f99c8d375cd/M_height'),
  Food(
      category: 'Суши',
      name: 'Суши с лососем',
      price: 350,
      weight: 200,
      quontity: 4,
      description:
          'Традиционные суши со свежим лососем. Попробовав однажды эти суши, вы познаёте дзэн. Данными суши можно дополнить большой сет.',
      imagePath:
          'https://static.tildacdn.com/tild3861-3032-4732-a637-616535356364/SUSHI-S-LOSOSEM1.png'),
];
