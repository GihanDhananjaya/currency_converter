import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/configurations/app_config.dart';
import '../core/service/app_navigation_manager.dart';
import '../core/service/dependency_injection.dart';
import '../features/data/datasources/shared_preference.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/enums.dart';
import '../utils/navigation_routes.dart';

class CurrencyConverterApp extends StatefulWidget {
  @override
  State<CurrencyConverterApp> createState() => _CurrencyConverterAppState();
}

class _CurrencyConverterAppState extends State<CurrencyConverterApp> {

  final appSharedData = injection<AppSharedData>();
  //final localPushManager = LocalPushManager.init();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 851),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: AppConstants.appName,
            navigatorKey: NavigationManager().navigatorKey,
            initialRoute: Routes.kCurrencyConvertView,
            onGenerateRoute: Routes.generateRoute,
            theme: ThemeData(
                primaryColor: AppColors.colorPrimary,
                scaffoldBackgroundColor: AppColors.colorPrimary),
          );
        });
  }
}
