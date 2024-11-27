// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class CurrencyService {
//   final String baseUrl = 'https://hexarate.paikama.co/api/rates/latest';
//
//   Future<Map<String, double>> fetchRates(String baseCurrency) async {
//     final response = await http.get(Uri.parse('$baseUrl/$baseCurrency?target=USD'));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return Map<String, double>.from(data['rates']);
//     } else {
//       throw Exception('Failed to load currency rates');
//     }
//   }
// }
