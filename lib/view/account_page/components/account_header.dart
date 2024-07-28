import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/user_controller.dart';
import 'package:serene_track/gen/assets.gen.dart';
import 'package:serene_track/view/account_page/edit_account_page.dart';
import 'package:serene_track/view/account_setting_page/account_setting_page.dart';

class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: iconImage(user.photoUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 72,
                  width: 72,
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyles.title,
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                context.push(AccountSettingPage.routeLocation);
              },
              icon: const Icon(
                Icons.menu,
                color: textMainColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        editButton(context),
        const SizedBox(height: 16),
        RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          text: TextSpan(
            children: [
              const TextSpan(
                text: '$shortGorlTx : ',
                style: TextStyles.accountHeaderBoldTextStyle,
              ),
              TextSpan(
                text: user.shortTermGoal,
                style: TextStyles.accountHeaderTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          text: TextSpan(
            children: [
              const TextSpan(
                text: '$longGorlTx : ',
                style: TextStyles.accountHeaderBoldTextStyle,
              ),
              TextSpan(
                text: user.longTermGoal,
                style: TextStyles.accountHeaderTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget editButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: appleColor,
        backgroundColor: backGroundColor,
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        side: const BorderSide(
          color: appleColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        elevation: 0,
      ),
      onPressed: () {
        context.push(EditAccountPage.routeLocation);
      },
      child: const Text('プロフィールを編集'),
    );
  }

  ImageProvider<Object> iconImage(String url) {
    bool networkImage = url.substring(0, 8) == 'https://';
    if (networkImage) {
      return NetworkImage(
        url,
      );
    } else {
      return AssetImage(
        Assets.images.icons.sereneTrackIconBlack.path,
      ) as ImageProvider;
    }
  }
}
