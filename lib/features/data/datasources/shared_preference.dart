import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


const String _APP_TOKEN = 'app_token';
const String _PUSH_TOKEN = 'push_token';
const String _NEAREST_CITY = 'nearest_city';
const String _INITIAL_CHECK = 'initial_check';
const String _DASHBOARD_DATA = 'dashboard_data';

class AppSharedData {
  late SharedPreferences secureStorage;

  AppSharedData(SharedPreferences preferences) {
    secureStorage = preferences;
  }

  ///APP TOKEN
  bool hasAppToken() {
    return secureStorage.containsKey(_APP_TOKEN);
  }

  removeAppToken() {
    secureStorage.remove(_APP_TOKEN);
  }

  setAppToken(String token) {
    secureStorage.setString(_APP_TOKEN, token);
  }

  String? getAppToken() {
    if (secureStorage.containsKey(_APP_TOKEN)) {
      return secureStorage.getString(_APP_TOKEN);
    } else {
      return "";
    }
  }

  ///PUSH TOKEN
  setPushToken(String token) {
    secureStorage.setString(_PUSH_TOKEN, token);
  }

  bool hasPushToken() {
    return secureStorage.containsKey(_PUSH_TOKEN);
  }

  String? getPushToken() {
    if (secureStorage.containsKey(_PUSH_TOKEN)) {
      return secureStorage.getString(_PUSH_TOKEN);
    } else {
      return "token";
    }
  }



  ///Initial Check
  bool hasInitialCheckDone() {
    return secureStorage.containsKey(_INITIAL_CHECK);
  }

  setInitialCheckDone() {
    secureStorage.setBool(_INITIAL_CHECK, true);
  }



  removeDashboardData() {
    secureStorage.remove(_DASHBOARD_DATA);
  }

  bool hasDashboardData() {
    return secureStorage.containsKey(_DASHBOARD_DATA);
  }


}
