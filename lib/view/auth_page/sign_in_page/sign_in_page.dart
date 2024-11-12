import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/gen/assets.gen.dart';
import 'package:serene_track/model/enum/form_state.dart';
import 'package:serene_track/utils/preferences_manager.dart';
import 'package:serene_track/view/auth_page/components/auth_text_field.dart';
import 'package:serene_track/view/auth_page/provider/form_provider.dart';
import 'package:serene_track/view/auth_page/sign_in_page/provider/form_key_for_sign_in_notifier.dart';
import 'package:serene_track/view/auth_page/sign_in_page/provider/sign_in_text_controller_notifier.dart';
import 'package:serene_track/view/auth_page/sign_up_page/sign_up_page.dart';
import 'package:serene_track/view/splash_page/splash_page.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});
  static String get routeName => 'sign_in';
  static String get routeLocation => '/$routeName';

  Future<String> signInUser({
    required WidgetRef ref,
    required String email,
    required String password,
  }) async {
    String res = failureSignIn;
    String signInRes = await ref.read(userProvider.notifier).signIn(
          email: email,
          password: password,
        );
    String getUserRes = await ref.read(userProvider.notifier).fetchUser();
    if (signInRes == successRes && getUserRes == successRes) {
      res = successSignIn;
      await PreferencesManager().setIsLogin(isLogin: true);
    }
    return res;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.0,
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
                  Text('サインイン', style: TextStyles.authPageTitle),
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
    final formKey = ref.watch(formKeyForSignInNotifierProvider);
    final formController = ref.read(formProvider.notifier);
    final emailController = ref.watch(signInEmailControllerNotifierProvider);
    final passwordController =
        ref.watch(signInPasswordControllerNotifierProvider);
    final isLoading =
        ref.watch(userProvider.select((value) => value.isLoading));
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
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
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    AuthTextField(
                        caption: 'メールアドレス',
                        controller: emailController,
                        hintText: 'example@gmail.com',
                        validator: formController.emailrValidator),
                    const SizedBox(height: 16),
                    AuthTextField(
                      caption: 'パスワード',
                      controller: passwordController,
                      hintText: '6文字以上のパスワードを入力',
                      obscureText: true,
                      validator: formController.passwordValidator,
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () async {
                        FormStatus formStatus =
                            formController.validateForm(formKey);
                        if (formStatus == FormStatus.valid) {
                          String res = await signInUser(
                            ref: ref,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (res == successSignIn) {
                            if (!context.mounted) return;
                            context.go(SplashPage.routeLocation);
                          }
                          if (!context.mounted) return;
                          showSnackBar(res, context);
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
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: backGroundColor,
                                strokeWidth: 2,
                              )
                            : const Text('サインイン'),
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
                      '他のアカウントから',
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
                  const Text('アカウントをお持ちでないですか？'),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: linkBlue,
                    ),
                    onPressed: () {
                      context.go(SignUpPage.routeLocation);
                    },
                    child: const Text('新規登録'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
