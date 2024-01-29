import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CitySelectionPage extends StatefulWidget {
  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  String selectedCity = ''; // Переменная для отслеживания выбранного города
  List<String> cities = [
    'Тольятти',
    'Самара',
    'Сызрань',
    'Кинель',
    'Жигулёвск',
  ]; // Ваши города

  @override
  void initState() {
    super.initState();
    _loadSelectedCity();
  }

  Future<void> _loadSelectedCity() async {
    String? savedCity = await CityManager.getSelectedCity();
    if (savedCity != null) {
      setState(() {
        selectedCity = savedCity;
      });
    }
  }

  Future<void> _saveSelectedCity(String city) async {
    await CityManager.saveSelectedCity(city);
    setState(() {
      selectedCity = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Выбор города',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Выбранный город: $selectedCity',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                return ListTile(
                  title: Text(city),
                  onTap: () async {
                    await _saveSelectedCity(city);
                    // Вы можете добавить дополнительную логику после выбора города
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CityManager {
  static const String _keySelectedCity = 'selectedCity';

  static Future<void> saveSelectedCity(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keySelectedCity, city);
  }

  static Future<String?> getSelectedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySelectedCity);
  }
}
