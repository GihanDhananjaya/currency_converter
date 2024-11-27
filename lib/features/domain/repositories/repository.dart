import 'package:dartz/dartz.dart';
import '../../../error/failures.dart';
import '../../data/models/request/currency_request.dart';
import '../../data/models/response/currency_response.dart';


abstract class Repository {
  Future<Either<Failure, CurrencyResponse>> currencyDataAPI(CurrencyRequest currencyRequest);
}
