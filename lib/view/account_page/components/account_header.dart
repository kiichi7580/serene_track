import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/view/account_page/edit_account_page.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: appleColor,
            backgroundColor: backGroundColor,
            textStyle: TextStyles.accountHeaderTextStyle,
            side: const BorderSide(
              color: appleColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            elevation: 0,
          ),
          onPressed: () {
            context.go(EditAccountPage.routeLocation);
          },
          child: const Text('プロフィールを編集'),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Text(
              '短期目標:  ',
              style: TextStyles.accountHeaderBoldTextStyle,
            ),
            Text(
              '短いことをする',
              style: TextStyles.accountHeaderTextStyle,
              softWrap: true,
              maxLines: 2,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Text(
              '長期目標:  ',
              style: TextStyles.accountHeaderBoldTextStyle,
            ),
            Text(
              '長いことをする',
              style: TextStyles.accountHeaderTextStyle,
              softWrap: true,
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }
}
