import 'dart:core';
import 'package:currency_converter/features/data/datasources/shared_preference.dart';
import '../../../core/network/api_helper.dart';
import '../models/request/currency_request.dart';
import '../models/response/currency_response.dart';


abstract class RemoteDataSource {

  Future<CurrencyResponse> currencyAPI(CurrencyRequest currencyRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;
  final AppSharedData appSharedData;

  RemoteDataSourceImpl({required this.apiHelper, required this.appSharedData});



  @override
  Future<CurrencyResponse> currencyAPI(
      CurrencyRequest currencyRequest) async {
    try {
      final response = await apiHelper.get(
        "v7/currencies?apiKey=${currencyRequest.apiKey}",
      );
      return CurrencyResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

}
