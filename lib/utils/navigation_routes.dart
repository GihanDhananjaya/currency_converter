import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../features/domain/entities/place_entity.dart';
import '../features/presentation/views/currency/currency_convert_view.dart';
import '../features/presentation/views/splash/splash_view.dart';
import '../main.dart';

class Routes {
  static const String kCurrencyConvertView = "kCurrencyConvertView";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kCurrencyConvertView:
        return PageTransition(
            child: CurrencyConvertView(), type: PageTransitionType.fade);

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
