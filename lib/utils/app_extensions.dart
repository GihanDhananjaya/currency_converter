import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'enums.dart';


extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }
}

extension DeviceOSExt on DeviceOS {
  String getValue() {
    if (Platform.isIOS) {
      return "IOS";
    } else {
      return toString().split(".").last;
    }
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}
