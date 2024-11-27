import 'package:flutter/material.dart';

class NavigationManager {
  static final NavigationManager _instance = NavigationManager._internal();

  factory NavigationManager() {
    return _instance;
  }

  NavigationManager._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void push(String routeName, {Object? arguments, Function(String)? onError}) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments).onError((error, t){
      if(onError!=null) onError(error.toString());
    });
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void replace(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }
}