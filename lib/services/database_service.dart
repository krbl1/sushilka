import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/foods.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Food>> fetchMenuData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('menu').get();

      if (querySnapshot.docs.isNotEmpty) {
        List<Food> foods = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Food.fromJson(data);
        }).toList();

        return foods;
      } else {
        // print('Коллекция "menu" не содержит документов');
        return [];
      }
    } catch (error) {
      // print('Ошибка при получении данных из Firestore: $error');
      return [];
    }
  }
}
