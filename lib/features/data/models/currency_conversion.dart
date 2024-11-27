// models/currency_conversion.dart
class CurrencyConversion {
  final String targetCurrency;
  final double rate;

  CurrencyConversion({required this.targetCurrency, required this.rate});

  factory CurrencyConversion.fromJson(String targetCurrency, dynamic json) {
    return CurrencyConversion(
      targetCurrency: targetCurrency,
      rate: json as double,
    );
  }
}
