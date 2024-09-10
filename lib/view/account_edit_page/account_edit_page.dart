import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/button/loading_button.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/gen/assets.gen.dart';
import 'package:serene_track/model/enum/form_state.dart';
import 'package:serene_track/view/account_edit_page/components/account_text_field.dart';
import 'package:serene_track/components/button/custom_button.dart';
import 'package:serene_track/view/account_edit_page/provider/account_text_field_notifier.dart';
import 'package:serene_track/view/account_edit_page/provider/form_key_for_edit_account_notifier.dart';
import 'package:serene_track/view/account_page/account_page.dart';
import 'package:serene_track/view/auth_page/provider/form_provider.dart';

class AccountEditPage extends ConsumerWidget {
  const AccountEditPage({super.key});
  static String get routeName => 'edit_account';
  static String get routeLocation => '/$routeName';

  Future<String> updateUser({
    required WidgetRef ref,
    required String name,
    required String shortTermGoal,
    required String longTermGoal,
  }) async {
    String res = failureUpDate;
    res = await ref.read(userProvider.notifier).updateUser(
          name: name,
          shortTermGoal: shortTermGoal,
          longTermGoal: longTermGoal,
        );
    if (res == successRes) res = successUpDate;
    return res;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.select((value) => value.user));
    final isLoading =
        ref.watch(userProvider.select((value) => value.isLoading));
    final nameController = ref.watch(nameControllerNotifierProvider(user.name));
    final shortTermGoalController =
        ref.watch(shortTermGorlControllerNotifierProvider(user.shortTermGoal));
    final longTermGoalController =
        ref.watch(longTermGorlControllerNotifierProvider(user.longTermGoal));
    final formController = ref.read(formProvider.notifier);
    final formKey = ref.read(formKeyForEditAccountNotifierProvider);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(title: 'アカウントを編集'),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: const BoxDecoration(
            color: backGroundColor,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: iconImage(user.photoUrl),
                    radius: 64,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                AccountTextField(
                  caption: userName,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  maxLength: 45,
                  validator: formController.basicValidator,
                ),
                const SizedBox(height: 4),
                AccountTextField(
                  caption: shortTermGorlTx,
                  controller: shortTermGoalController,
                  keyboardType: TextInputType.text,
                  maxLength: 100,
                  validator: formController.basicValidator,
                ),
                const SizedBox(height: 4),
                AccountTextField(
                  caption: longTermGorlTx,
                  controller: longTermGoalController,
                  keyboardType: TextInputType.text,
                  maxLength: 100,
                  validator: formController.basicValidator,
                ),
                const SizedBox(height: 16),
                isLoading
                    ? const LoadingButton()
                    : CustomButton(
                        buttonText: '更新する',
                        onTap: () async {
                          FormStatus formStatus =
                              formController.validateForm(formKey);
                          if (formStatus == FormStatus.valid) {
                            String res = await updateUser(
                              ref: ref,
                              name: nameController.text,
                              shortTermGoal: shortTermGoalController.text,
                              longTermGoal: longTermGoalController.text,
                            );
                            if (res == successUpDate) {
                              if (!context.mounted) return;
                              context.go(AccountPage.routeLocation);
                              showSnackBar(res, context);
                            } else {
                              if (!context.mounted) return;
                              showSnackBar(
                                res,
                                context,
                                backgroundColor: noReactionColor,
                              );
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider<Object> iconImage(String? url) {
    if (url == null || url.isEmpty || url.length < 8) {
      return AssetImage(
        Assets.images.icons.sereneTrackIconBlack.path,
      ) as ImageProvider;
    }
    bool networkImage = url.startsWith('https://');
    if (networkImage) {
      return NetworkImage(url);
    } else {
      return AssetImage(
        Assets.images.icons.sereneTrackIconBlack.path,
      ) as ImageProvider;
    }
  }
}
