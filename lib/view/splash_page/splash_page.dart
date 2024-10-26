import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/health_care_notifier.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/splash_page/splash_page_notifier.dart';
import 'package:serene_track/view/start_stepper_page/start_stepper_page.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});
  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        ref.listen<bool?>(splashPageProvider.select((value) => value.isLogin),
            (_, isLogin) async {
          final isFirstLaunchAfterInstall = ref.watch(splashPageProvider
              .select((value) => value.isFirstLaunchAfterInstall));
          if (isLogin == true && isFirstLaunchAfterInstall == true) {
            await Future.delayed(const Duration(seconds: 2));
            if (!context.mounted) return;
            context.go(StartStepperPage.routeLocation);
          } else if (isLogin == true) {
            ref.watch(healthCareProvider);
            await Future.delayed(const Duration(seconds: 2));
            if (!context.mounted) return;
            context.go(TodoPage.routeLocation);
          } else {
            context.go(SignInPage.routeLocation);
          }
        });
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: lightSkyBlueColor,
              strokeWidth: 3,
            ),
          ),
        );
      },
    );
  }
}
