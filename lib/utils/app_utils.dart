import 'package:flutter/material.dart';


class AppUtils {
  static TimeOfDay getTimeFromString(String time) {
    return TimeOfDay(
        hour: int.parse(time.split(':')[0]),
        minute: int.parse(time.split(':')[1].split(' ')[0]));
  }

  static String convertTimeOfDayToAPIFormat(TimeOfDay value) {
    return '${value.hour}:${value.minute}:00';
  }

  static String convertTimeToAPIFormat(String value) {
    final time = getTimeFromString(value);
    return convertTimeOfDayToAPIFormat(time);
  }


  static String formatDistance(int distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters}m';
    } else {
      double distanceInKm = distanceInMeters / 1000.0;
      String formattedDistance = distanceInKm.toStringAsFixed(1);
      return '${formattedDistance}km';
    }
  }

  static String formatDuration(int durationInMinutes) {
    if (durationInMinutes < 60) {
      return '$durationInMinutes min';
    } else {
      int hours = durationInMinutes ~/ 60;
      int remainingMinutes = durationInMinutes % 60;
      if (remainingMinutes == 0) {
        return '$hours hour${hours > 1 ? 's' : ''}';
      } else {
        return '$hours hour${hours > 1 ? 's' : ''} $remainingMinutes min';
      }
    }
  }



  static String cleanWhitespace(String input) {
    return input.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

}
