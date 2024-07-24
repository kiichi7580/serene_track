import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/view/health_care_page/health_care_app_integration_page.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});
  static String get routeName => 'account_setting';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              context.push(HealthCareAppIntegrationPage.routeLocation);
            },
          ),
        ],
      ),
    );
  }

  Widget settingItem({
    required String title,
    required IconData? iconData,
    required void Function()? onPressed,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: Icon(iconData),
      title: Text(title, style: TextStyles.caption),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
