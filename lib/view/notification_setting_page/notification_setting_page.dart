import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/utils/permission/request_notification_permission.dart';
import 'package:serene_track/view/notification_setting_page/provider/notification_setting_page_notifier.dart';

class NotificationSettingPage extends ConsumerWidget {
  const NotificationSettingPage({super.key});
  static String get routeName => 'notification_setting';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationPermissionStatus = ref.watch(
        notificationSettingPageProvider
            .select((value) => value.notificationPermissionStatus));
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(
        title: '通知設定',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 8),
            ListTile(
              title: const Text(
                '通知を許可する',
                style: TextStyles.caption,
              ),
              trailing: CupertinoSwitch(
                value: notificationPermissionStatus,
                onChanged: (value) async {
                  await requestNotificationPermission(context);
                },
              ),
            ),
            const SizedBox(height: 16),
            const ListTile(
              subtitle: Text(
                '　通知を許可すると、アプリ内で通知設定を追加することができます。\n'
                '　通知許可の設定はこの画面からいつでも変更できます。',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
