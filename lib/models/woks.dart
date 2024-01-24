import 'dart:convert';

class Woks {
  String name;
  double price;
  double weight;
  String description;
  String imagePath;

  Woks({
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

List woksMenu = [
  Woks(
      name: 'Филадельфия',
      price: 350,
      weight: 400,
      description:
          'Вкуснейшие роллы со свежайшим лососем, приготовленные по старинному рецепту Йоши Накомуро',
      imagePath:
          'https://foodband.ru/wp-content/uploads/2016/09/1466-original-1692290368.jpg'),
  Woks(
      name: 'Сет Кукан',
      price: 1500,
      weight: 2000,
      description:
          'Сет на большую компанию. Приготовллен с огоньком, так что берегите свой кукан. Состав: Ролл Кривой, Ролл Сырой, Ролл Вкусный, Ролл Калифорния',
      imagePath:
          'https://thapl-public.storage.yandexcloud.net/thapl-project415/img/CatalogItem/4537fcf43ba98a245502b8ce4f45eb54_thumb_50_1458_1458.jpg')
];
