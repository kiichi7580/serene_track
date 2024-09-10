import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/utils/permission/request_notification_permission.dart';

part 'notification_setting_page_notifier.freezed.dart';

@freezed
class NotificationSettingPageState with _$NotificationSettingPageState {
  const factory NotificationSettingPageState({
    @Default(false) bool notificationPermissionStatus,
  }) = _NotificationSettingPageState;
}

final notificationSettingPageProvider = StateNotifierProvider.autoDispose<
    NotificationSettingPageController, NotificationSettingPageState>((ref) {
  return NotificationSettingPageController();
});

class NotificationSettingPageController
    extends StateNotifier<NotificationSettingPageState> {
  NotificationSettingPageController()
      : super(const NotificationSettingPageState()) {
    init();
  }

  Future<void> init() async {
    await checkPermissionStatus();
  }

  Future<void> checkPermissionStatus() async {
    bool notificationPermissionStatus = await checkNotificationPermission();
    state = state.copyWith(
        notificationPermissionStatus: notificationPermissionStatus);
  }
}
