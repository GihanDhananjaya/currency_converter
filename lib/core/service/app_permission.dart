import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionManager {
  static requestCameraPermission(
      BuildContext context, VoidCallback onGranted) async {
    if (await Permission.camera.request().isGranted) {
      onGranted();
    }
  }

  static requestExternalStoragePermission(
      BuildContext context, VoidCallback onGranted) async {
    if (await Permission.storage.request().isGranted) {
      onGranted();
    }
  }

  static requestGalleryPermission(BuildContext context, VoidCallback onGranted,
      Function(String) onError) async {
    onGranted();
  }

  static requestLocationPermission(
      {required VoidCallback onGranted,
      required VoidCallback onError,
      required VoidCallback onPermanentlyDenied}) async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      onGranted();
    } else {
      if (status.isDenied) {
        if (await Permission.location.request().isGranted) {
          onGranted();
        } else {
          onError();
        }
      } else if (status.isPermanentlyDenied) {
        onPermanentlyDenied();
      } else {
        onPermanentlyDenied();
      }
    }
  }

  static requestNotificationPermissions(
      VoidCallback onGranted,
      Function(String) onError,
      ) async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      onGranted();
    } else if (status.isDenied) {
      onError('You have to grant Notification permission');
    } else if (status.isPermanentlyDenied) {
      // await openAppSettings();
      onError('You have to grant Notification permission');
    } else {
      onError('Notification permissions are denied');
    }
  }
}
