class Currency {
  final String code;
  final String symbol;

  Currency({required this.code, required this.symbol});
}

// lib/domain/entities/conversion_result.dart
class ConversionResult {
  final double amount;
  final Currency toCurrency;

  ConversionResult({required this.amount, required this.toCurrency});
}