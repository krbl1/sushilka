import 'package:flutter/material.dart';
import 'package:sush_roys/services/database_service.dart';
import 'foods.dart';

class Shop extends ChangeNotifier {
  List<Food> _foodsMenu = [];

  List<Food> _cart = [];

  final DatabaseService _databaseService = DatabaseService();

  Shop() {
    fetchMenuData();
  }

  Future<void> fetchMenuData() async {
    print('chuchu');
    _foodsMenu = await _databaseService.fetchMenuData();
    notifyListeners();
  }

  List<Food> get foodsMenu => _foodsMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
