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
  Food(
      category: 'Вок',
      name: 'Вок с курицей',
      price: 500,
      weight: 400,
      quontity: 1,
      description:
          'Вок с курицей — азиатское блюдо, приготовленное на высокой температуре в специальной сковороде. Включает в себя курицу, овощи (брокколи, морковь, цукини, перец, грибы) и ароматный соус из соевого соуса, имбиря, чеснока и кунжутного масла. Подаётся с рисом или лапшой. Быстро, вкусно, насыщенно.',
      imagePath:
          'https://sun9-80.userapi.com/impg/bRKhNOr0-tG2k86ciqEyxQ27pFTuhzhkorFSYA/4Hw7-xoG9Jw.jpg?size=1050x1050&quality=96&sign=a10c4b8b2e944fa8024be14375056f23&c_uniq_tag=xxnBafQUyIQc3hYTCAputrqROns2_iK52Q1TK6oMQfI&type=album'),
  Food(
      category: 'Вок',
      name: 'Вок с креветками',
      price: 500,
      weight: 400,
      quontity: 1,
      description:
          'Вок с креветками — восточное блюдо, приготовленное путем быстрого обжаривания креветок и свежих овощей на высокой температуре в воке. Креветки обычно обжаривают до золотистой корки, добавляются разнообразные овощи, такие как бамбуковые ростки, цукини, морковь и грибы.',
      imagePath:
          'https://cdn.foodpicasso.com/assets/2022/07/10/b71e4a2acce31020f43184f485406654---jpg_1000x_103c0_convert.jpg'),
  Food(
      category: 'Вок',
      name: 'Вок с говядиной',
      price: 700,
      weight: 400,
      quontity: 1,
      description:
          """Вок с говядиной в нашем ресторане  — это воплощение утонченного сочетания сочной говядины и свежих ароматных овощей. Нежные ломтики говядины обжариваются до идеальной прожарки в высокой температуре, а затем танцуют с разнообразными овощами, такими как брокколи, морковь, грибы и зеленый лук.

Секрет нашего вока — в уникальном соусе, который обогащает блюдо насыщенным вкусом. Соус, состоящий из соевого соуса, имбиря, чеснока и других приправ, придает говядине и овощам изысканный восточный аромат.""",
      imagePath:
          'https://p2.zoon.ru/5/3/6106766ff4ee133b0833df08_626d180250c571.93310964.jpg'),
  Food(
      category: 'Поке',
      name: 'Поке с лососем',
      price: 700,
      weight: 650,
      quontity: 1,
      description:
          '''Поке с лососем в нашем ресторане — это исключительно свежее и лакомое блюдо, вдохновленное гавайской кухней. Нежные кусочки свежего лосося, маринованные в соевом соусе, смешиваются с ароматным чесноком, маслом кунжута и зеленым луком.

К приготовленному лососю добавляются свежие овощи, такие как авокадо, огурцы и помидоры, придающие поке невероятную свежесть и хрустящий характер.

Поке с лососем — это не только вкусное, но и здоровое блюдо, богатое белками и полезными микроэлементами. Это отличный выбор для тех, кто ценит легкость, свежесть и гармонию в каждом кулинарном опыте.''',
      imagePath:
          'http://kipen.ru/image/cache/catalog/demo/Japan%20menu/125-Поке-с-лососем-700x700.png'),
  Food(
      category: 'Поке',
      name: 'Поке с курицей',
      price: 700,
      weight: 650,
      quontity: 1,
      description:
          '''Поке с говядиной в нашем ресторане — это современное творение, сочетающее изысканность и вкус гавайской кухни с неповторимым вкусом говядины. Нежные ломтики маринованной говядины, обсыпанные соевым соусом, имбирем и чесноком, образуют основу этого блюда.

К говядине добавляются свежие овощи, такие как огурцы, помидоры, авокадо и зеленый лук, создавая хрустящую и сочную текстуру. Подача происходит на рисе или лапше.

Поке с говядиной — это не только гастрономическое удовольствие, но и источник белка и витаминов. Благодаря свежим ингредиентам и уникальной маринадной основе, это блюдо предоставляет настоящий вкусовой праздник для ценителей кулинарных изысков.''',
      imagePath:
          'https://nihon-ryazan.ru/image/cache/catalog/black/old_black/11-1600x1070.jpg'),
];
