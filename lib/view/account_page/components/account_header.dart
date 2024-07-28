import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/gen/assets.gen.dart';
import 'package:serene_track/view/account_page/edit_account_page.dart';
import 'package:serene_track/view/account_setting_page/account_setting_page.dart';

class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;
    print('User: $user');
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
                      userName(user.name),
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
                text: '$shortTermGorlTx : ',
                style: TextStyles.accountHeaderBoldTextStyle,
              ),
              TextSpan(
                text: shortTermGoal(user.shortTermGoal),
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
                text: '$longTermGorlTx : ',
                style: TextStyles.accountHeaderBoldTextStyle,
              ),
              TextSpan(
                text: longTermGoal(user.longTermGoal),
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

  String userName(String name) {
    if (name != '') {
      return name;
    } else {
      return 'ユーザー';
    }
  }

  String shortTermGoal(String goal) {
    if (goal != '') {
      return goal;
    } else {
      return '短い期間で達成できそうな目標を設定しましょう。';
    }
  }

  String longTermGoal(String goal) {
    if (goal != '') {
      return goal;
    } else {
      return '長期的に達成したい目標を設定しましょう。';
    }
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
