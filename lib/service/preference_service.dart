// import 'package:shared_preferences/shared_preferences.dart';
//
// class PreferencesService {
//   Future<void> savePreferredCurrencies(List<String> currencies) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('preferredCurrencies', currencies);
//   }
//
//   Future<List<String>> getPreferredCurrencies() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList('preferredCurrencies') ?? ['USD'];
//   }
// }
