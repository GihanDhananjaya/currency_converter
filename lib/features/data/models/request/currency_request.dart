// To parse this JSON data, do
//
//     final currencyRequest = currencyRequestFromJson(jsonString);

import 'dart:convert';

CurrencyRequest currencyRequestFromJson(String str) => CurrencyRequest.fromJson(json.decode(str));

String currencyRequestToJson(CurrencyRequest data) => json.encode(data.toJson());

class CurrencyRequest {
  String apiKey;

  CurrencyRequest({
    required this.apiKey,
  });

  factory CurrencyRequest.fromJson(Map<String, dynamic> json) => CurrencyRequest(
    apiKey: json["apiKey"],
  );

  Map<String, dynamic> toJson() => {
    "apiKey": apiKey,
  };
}
