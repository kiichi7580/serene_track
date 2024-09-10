import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:serene_track/components/dialog/show_notification_permission_dialog.dart';

Future<void> initRequestNotificationPermission() async {
  PermissionStatus permissionStatus = await Permission.notification.status;
  if (permissionStatus.isDenied) {
    Permission.notification.request();
  }
}

Future<void> requestNotificationPermission(BuildContext context) async {
  if (!context.mounted) return;
  final response = await showNotificationPermissionDialog(context);
  if (response == null || response == false) {
    return;
  }
  openAppSettings();
}

Future<bool> checkNotificationPermission() async {
  PermissionStatus permissionStatus = await Permission.notification.status;
  if (permissionStatus.isGranted) {
    return true;
  } else {
    return false;
  }
}
