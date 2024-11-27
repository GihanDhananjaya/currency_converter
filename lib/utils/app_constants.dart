import 'package:flutter/material.dart';
import '../features/domain/entities/nearby_type_entity.dart';

class AppConstants {
  static const String appName = 'Paradise Guide';
  static const String appleStoreID = '3234234';
  static const String androidPlayID = 'com.paradiseguide.app';

  static const String topicAllNotifications = 'paradise_guide_notifications';

  static bool isPushServiceInitialized = false;
  static int? dynamicPlaceId;

  static double UI_PADDING = 35.0;
  static EdgeInsets appPadding = EdgeInsets.all(
    AppConstants.UI_PADDING,
  );
  static double UI_COMPONENT_PADDING = 15;
  static Gradient COMMON_UI_GRADIENT = const LinearGradient(
      colors: [
        Colors.white,
        Color(0xFFE1E1E1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.11, 0.58]);

  //Sort Type Id
  static const int kLocationStatusPublished = 3;



}
