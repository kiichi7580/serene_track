import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/component/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/gen/assets.gen.dart';
import 'package:serene_track/model/enum/form_state.dart';
import 'package:serene_track/model/user.dart';
import 'package:serene_track/view/account_page/widgets/auth_text_field.dart';
import 'package:serene_track/view/auth_page/provider/auth_provider.dart';
import 'package:serene_track/view/auth_page/provider/form_provider.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/auth_page/sign_up_page/provider/sign_up_text_cotroller_notifier.dart';
import 'package:serene_track/view/auth_page/sign_up_page/provider/form_key_for_sign_up_notifier.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});
  static String get routeName => 'sign_up';
  static String get routeLocation => '/$routeName';

  Future<void> signUpUser({
    required BuildContext context,
    required WidgetRef ref,
    required String email,
    required String password,
  }) async {
    String res = failureSignUp;
    String signUpRes =
        await ref.read(authProvider.notifier).signUp(email, password);
    User? userData = await ref.read(authProvider.notifier).getUser(ref);
    if (signUpRes == successRes && userData != null) {
      String res = successSignUp;
      await Future.delayed(const Duration(milliseconds: 10));
      if (!context.mounted) return;
      context.go(TodoPage.routeLocation);
      showSnackBar(res, context);
    } else {
      if (!context.mounted) return;
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appleColor,
              sandwispColor,
            ],
          ),
        ),
        child: buildBody(context, ref),
      ),
    );
  }

  Widget buildBody(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Flexible(flex: 2, child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('新規登録', style: TextStyles.authPageTitle),
                  Text('ようこそ！', style: TextStyles.title),
                ],
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    Assets.images.icons.sereneTrackIcon.path,
                  ),
                ),
              )
            ],
          ),
          Flexible(flex: 1, child: Container()),
          buildBodyContent(context, ref),
        ],
      ),
    );
  }

  Widget buildBodyContent(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyForSignUpNotifierProvider);
    final formController = ref.read(formProvider.notifier);
    final emailController = ref.watch(signUpEmailControllerNotifierProvider);
    final passwordController =
        ref.watch(signUpPasswordControllerNotifierProvider);
    final confirmationPasswordController =
        ref.watch(signUpConfirmationPasswordControllerNotifierProvider);

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.76,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(48),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    AuthTextField(
                      caption: 'メールアドレス',
                      controller: emailController,
                      hintText: 'example@gmail.com',
                      validator: formController.emailrValidator,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      caption: 'パスワード',
                      controller: passwordController,
                      hintText: '6文字以上のパスワードを入力',
                      obscureText: true,
                      validator: formController.passwordValidator,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      caption: '確認用パスワード',
                      controller: confirmationPasswordController,
                      hintText: 'もう一度パスワードを入力',
                      obscureText: true,
                      validator: formController.confirmationPasswordValidator,
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () async {
                        formController
                            .getConfirmationPassword(passwordController.text);
                        FormStatus formStatus =
                            formController.validateForm(formKey);
                        if (formStatus == FormStatus.valid) {
                          await signUpUser(
                            context: context,
                            ref: ref,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              yellowGreenColor,
                              appleColor,
                            ],
                          ),
                        ),
                        child: const Text('新規登録'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '別のアカウント',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('すでにアカウントをお持ちですか？'),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: linkBlue,
                    ),
                    onPressed: () {
                      context.go(SignInPage.routeLocation);
                    },
                    child: const Text('サインイン'),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
