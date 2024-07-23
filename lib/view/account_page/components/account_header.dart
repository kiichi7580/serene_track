import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/view/account_page/edit_account_page.dart';
import 'package:serene_track/view/account_setting_page/account_setting_page.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://blog-imgs-70.fc2.com/c/h/a/charnoir/men030.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 72,
                  width: 72,
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ユーザー名',
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
          text: const TextSpan(
            children: [
              TextSpan(
                text: '$shortGorlTx : ',
                style: TextStyles.accountHeaderBoldTextStyle,
              ),
              TextSpan(
                text: '短いことをする',
                style: TextStyles.accountHeaderTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '$longGorlTx :',
                style: TextStyles.accountHeaderBoldTextStyle,
              ),
              TextSpan(
                text: '長いことをする',
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
}
