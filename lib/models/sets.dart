import 'dart:convert';

class Sets {
  String name;
  double price;
  double weight;
  int quontity;
  String description;
  String imagePath;

  Sets({
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

List setsMenu = [
  Sets(
      name: 'Филадельфия',
      price: 350,
      weight: 400,
      quontity: 8,
      description:
          'Вкуснейшие роллы со свежайшим лососем, приготовленные по старинному рецепту Йоши Накомуро',
      imagePath:
          'https://foodband.ru/wp-content/uploads/2016/09/1466-original-1692290368.jpg'),
  Sets(
      name: 'Сет Кукан',
      price: 1500,
      weight: 2000,
      quontity: 72,
      description:
          'Сет на большую компанию. Приготовллен с огоньком, так что берегите свой кукан. Состав: Ролл Кривой, Ролл Сырой, Ролл Вкусный, Ролл Калифорния',
      imagePath:
          'https://thapl-public.storage.yandexcloud.net/thapl-project415/img/CatalogItem/4537fcf43ba98a245502b8ce4f45eb54_thumb_50_1458_1458.jpg')
];
