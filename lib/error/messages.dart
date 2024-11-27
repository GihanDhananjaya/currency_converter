import 'failures.dart';

class ErrorMessages {
  ///error_title
  static const String TITLE_ERROR = "Error";
  static const String TITLE_SUCCESS = "Success";
  static const String TITLE_UPDATE = "Update";
  static const String TITLE_QUESTION = "Confirm";
  static const String TITLE_OTP = "Oops, Wrong OTP!";
  static const String ERROR_WRONG_PASSCODE = "Oops, Wrong Passcode!";
  static const String ERROR_PIN_MATCH = "Oops, the PINs didn’t match";

  ///error_messages
  static const String ERROR_CONNECTION =
      "Connection error.\nPlease check your internet connectivity";
  static const String ERROR_SOMETHING_WENT_WRONG =
      "Oops, Something went wrong!";
  static const String ERROR_APP_VERIFICATION_FAILED =
      "App verification failed!";

  static const String ERROR_QUICKJOB_EXIT =
      "Are you sure to exit from the Quick Job flow?";
  static const String ERROR_INVALID_MOBILE_NUMBER =
      "Oops. The mobile number you entered is invalid. Please check your number and try again.";
  static const String ERROR_WRONG_OTP =
      "Please double-check the code you've received and try again";

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection detected.';
      case ServerFailure:
        return (failure as ServerFailure).errorResponse.responseError ??
            'Unexpected error';
      case AuthorizedFailure:
        return 'Unauthorized User';
      default:
        return 'Unexpected error';
    }
  }
}
