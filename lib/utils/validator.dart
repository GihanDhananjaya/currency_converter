class Validator {
  static String regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String regexMobile = r"^\d{10}$";

  static bool validateNIC(String nic) {
    String nicPart1, nicPart2;
    int length = nic.length;
    bool retVal = false;
    try {
      if (length == 10) {
        try {
          nicPart1 = nic.substring(length - 1, length);
          nicPart2 = nic.substring(0, length - 1);

          double.parse(nicPart2);
          if (nicPart1 == "v" ||
              nicPart1 == "V" ||
              nicPart1 == "x" ||
              nicPart1 == "X") {
            retVal = validateDayOfTheYear(nic);
          }
        } on FormatException {
          retVal = false;
        }
      } else if (length == 12) {
        try {
          double.parse(nic);
          retVal = validateDayOfTheYear(nic);
        } on FormatException {
          retVal = false;
        }
      }
    } on Exception {
      retVal = false;
    }

    return retVal;
  }

  static bool validateDayOfTheYear(String nic) {
    bool ret = false;
    int sex = 0;
    if (nic.length == 10) {
      sex = int.parse(nic.substring(2, 5));
    } else if (nic.length == 12) {
      sex = int.parse(nic.substring(4, 7));
    }

    if ((sex > 0 && sex <= 366) || sex > 500 && sex <= 866) {
      ret = true;
    } else {
      ret = false;
    }
    return ret;
  }

  static bool validateEmail(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }
}
