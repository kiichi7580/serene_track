import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/components/dialog/show_image_change_confirmation_dialog.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/image_notifier.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/ui_core/image/user_icon_image.dart';
import 'package:serene_track/view/account_edit_page/account_edit_page.dart';
import 'package:serene_track/components/dialog/show_image_dialog.dart';
import 'package:serene_track/view/account_setting_page/account_setting_page.dart';

class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.select((value) => value.user));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () async {
                        await showImageDialog(
                          context: context,
                          imageUrl: user.photoUrl,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: userIconImage(user.photoUrl),
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) {
                              userIconImage('');
                            },
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 80,
                        width: 80,
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      left: 54,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      left: 56,
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          color: linkBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      bottom: -10,
                      child: IconButton(
                        icon: const Icon(
                          LineIcons.plus,
                          color: backGroundColor,
                          size: 16,
                        ),
                        onPressed: () async {
                          String? photoUrl = await ref
                              .read(imageProvider.notifier)
                              .pickImage();
                          if (photoUrl != null && photoUrl.isNotEmpty) {
                            if (!context.mounted) return;
                            final response =
                                await showImageChangeConfirmationDialog(
                                    context);
                            if (response == null || response == false) {
                              return;
                            }
                            ref
                                .read(userProvider.notifier)
                                .updateUserIcon(photoUrl);
                          }
                        },
                      ),
                    ),
                  ],
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
                LineIcons.bars,
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
                style: TextStyles.accountHeaderTextStyle.copyWith(
                  color: user.shortTermGoal.isEmpty ? greyColor : textMainColor,
                ),
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
                style: TextStyles.accountHeaderTextStyle.copyWith(
                  color: user.shortTermGoal.isEmpty ? greyColor : textMainColor,
                ),
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
        context.push(AccountEditPage.routeLocation);
      },
      child: const Text('プロフィールを編集'),
    );
  }

  String userName(String? name) {
    if (name != null && name != '') {
      return name;
    } else {
      return 'ユーザー';
    }
  }

  String shortTermGoal(String? goal) {
    if (goal != null && goal != '') {
      return goal;
    } else {
      return '短期間で達成できる目標を設定しましょう。';
    }
  }

  String longTermGoal(String? goal) {
    if (goal != null && goal != '') {
      return goal;
    } else {
      return '長期的に達成したい目標を設定しましょう。';
    }
  }
}
