import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/components/dialog/show_delete_confirmation_dialog.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/account_setting_page/components/show_sign_out_dialog.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/health_care_page/health_care_app_integration_page.dart';
import 'package:serene_track/view/notification_setting_page/notification_setting_page.dart';
import 'package:serene_track/view/todo_notification_page/todo_notification_page.dart';

class AccountSettingPage extends ConsumerWidget {
  const AccountSettingPage({super.key});
  static String get routeName => 'account_setting';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(
        title: 'アカウント設定',
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          settingItem(
            title: '通知設定',
            iconData: LineIcons.bell,
            onTap: () {
              context.push(NotificationSettingPage.routeLocation);
            },
          ),
          settingItem(
            title: 'タスク通知設定',
            iconData: LineIcons.bullhorn,
            onTap: () {
              context.push(TodoNotificationPage.routeLocation);
            },
          ),
          settingItem(
            title: 'ヘルスケアと連携する',
            iconData: LineIcons.heartAlt,
            onTap: () {
              context.push(HealthCareAppIntegrationPage.routeLocation);
            },
          ),
          settingItem2(
            title: 'サインアウトする',
            iconData: LineIcons.alternateSignOut,
            onTap: () async {
              final response = await showSignOutDialog(context);
              if (response == null || response == false) {
                return;
              }
              await ref.read(userProvider.notifier).signOut();
              if (!context.mounted) return;
              context.go(SignInPage.routeLocation);
            },
          ),
          settingItem2(
            title: 'アカウントを削除する',
            iconData: LineIcons.userSlash,
            onTap: () async {
              final response = await showDeleteConfirmationDialog(context);
              if (response == null || response == false) {
                return;
              }
              String res = await ref.read(userProvider.notifier).deleteUser();
              if (res == successRes) {
                if (!context.mounted) return;
                context.go(SignInPage.routeLocation);
              } else {
                if (!context.mounted) return;
                showSnackBar(
                  res,
                  context,
                  backgroundColor: noReactionColor,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget settingItem({
    required String title,
    required IconData? iconData,
    required void Function()? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: Icon(iconData),
      title: Text(title, style: TextStyles.caption),
      trailing: const Icon(LineIcons.angleRight),
      onTap: onTap,
    );
  }

  Widget settingItem2({
    required String title,
    required IconData? iconData,
    required void Function()? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: Icon(iconData, color: noReactionColor),
      title: Text(
        title,
        style: TextStyles.caption.copyWith(color: noReactionColor),
      ),
      onTap: onTap,
    );
  }
}
