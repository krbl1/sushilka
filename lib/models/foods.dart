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
