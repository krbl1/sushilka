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

  Food.fromJson(Map<String, dynamic> json)
      : this(
          category: json['category']! as String,
          name: json['name']! as String,
          price: (json['price']! as num).toDouble(),
          weight: (json['weight']! as num).toDouble(),
          quontity: json['quontity']! as int,
          description: json['description']! as String,
          imagePath: json['imagePath']! as String,
        );

  Food copyWith({
    String? category,
    String? name,
    double? price,
    double? weight,
    int? quontity,
    String? description,
    String? imagePath,
  }) {
    return Food(
      category: category ?? this.category,
      name: name ?? this.name,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      quontity: quontity ?? this.quontity,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'category': category,
      'name': name,
      'price': price,
      'weight': weight,
      'quontity': quontity,
      'description': description,
      'imagePath': imagePath,
    };
  }

  String get _category => category;
  String get _name => name;
  double get _price => price;
  double get _weight => weight;
  int get _quontity => quontity;
  String get _description => description;
  String get _imagePath => imagePath;
}
