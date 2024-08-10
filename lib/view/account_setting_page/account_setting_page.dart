import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/account_setting_page/components/show_sign_out_dialog.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/health_care_page/health_care_app_integration_page.dart';

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
            title: 'ヘルスケアと連携する',
            iconData: Icons.favorite,
            onTap: () {
              context.push(HealthCareAppIntegrationPage.routeLocation);
            },
          ),
          signOut(context: context, ref: ref),
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
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget signOut({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: const Icon(Icons.logout, color: noReactionColor),
      title: Text(
        'サインアウトする',
        style: TextStyles.caption.copyWith(color: noReactionColor),
      ),
      onTap: () async {
        final response = await showSignOutDiolog(
          context,
        );
        if (response == null || response == false) {
          return;
        }
        await ref.read(userProvider.notifier).signOut();
        context.go(SignInPage.routeLocation);
      },
    );
  }
}
