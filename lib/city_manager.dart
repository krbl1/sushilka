import 'package:shared_preferences/shared_preferences.dart';

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
