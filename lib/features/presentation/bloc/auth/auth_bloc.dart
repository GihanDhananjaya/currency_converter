import 'package:currency_converter/error/failures.dart';
import 'package:currency_converter/error/messages.dart';
import 'package:currency_converter/features/data/datasources/shared_preference.dart';
import 'package:currency_converter/features/data/models/common/common_error_response.dart';
import 'package:currency_converter/features/domain/repositories/repository.dart';
import 'package:currency_converter/features/presentation/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base_state.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class UserBloc extends Base<UserEvent, BaseState<UserState>> {
  final AppSharedData appSharedData;
  final Repository repository;

  UserBloc({
    required this.appSharedData,
    required this.repository,
  }) : super(CurrencyInitial()) {
    // Registering the event handler
    on<CurrencyDataEvent>(_currencyDataAPI);
  }

  Future<void> _currencyDataAPI(
      CurrencyDataEvent event, Emitter<BaseState<UserState>> emit) async {
    emit(APILoadingState()); // Start loading state
    try {
      // Call repository API
      final result = await repository.currencyDataAPI(event.currencyRequest);

      emit(
        result.fold(
              (failure) {
            // Handle failure
            if (failure is ServerFailure) {
              return APIFailureState(errorResponseModel: failure.errorResponse);
            } else if (failure is AuthorizedFailure) {
              return AuthorizedFailureState(errorResponseModel: failure.errorResponse);
            } else {
              return APIFailureState(
                errorResponseModel: ErrorResponseModel(
                  responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                  responseCode: '',
                ),
              );
            }
          },
              (success) {
            // Handle success
            //if (success == 200) { // Replace `results` if it isn't a status code
              return CurrencyDataState(result: success.results);
            // } else {
            //   return APIFailureState(
            //     errorResponseModel: ErrorResponseModel(
            //       responseCode: '',
            //       responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
            //     ),
            //   );
            // }
          },
        ),
      );
    } catch (e) {
      // Optional: Catch unexpected errors
      emit(APIFailureState(
        errorResponseModel: ErrorResponseModel(
          responseError: e.toString(),
          responseCode: 'UNEXPECTED_ERROR',
        ),
      ));
    }
  }
}
