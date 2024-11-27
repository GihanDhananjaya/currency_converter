import 'package:currency_converter/error/failures.dart';
import 'package:currency_converter/features/data/models/request/currency_request.dart';
import 'package:currency_converter/features/data/models/response/currency_response.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/network_info.dart';
import '../../../error/exceptions.dart';
import '../../../error/messages.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/common/common_error_response.dart';


class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CurrencyResponse>> currencyDataAPI(
      CurrencyRequest currencyRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.currencyAPI(currencyRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

}
