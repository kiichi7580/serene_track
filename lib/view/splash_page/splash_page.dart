import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/user_async_value_notifier.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/splash_page/splash_page_notifier.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});
  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User?> asyncValue = ref.watch(userAsyncValueProvider);

    asyncValue.when(
      data: (user) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (user != null) {
            await ref.read(userProvider.notifier).fetchUserData(user);
            final isLogin =
                ref.watch(splashPageProvider.select((value) => value.isLogin));
            if (isLogin == false) {
              context.go(SignInPage.routeLocation);
            } else {
              context.go(TodoPage.routeLocation);
            }
          } else {
            context.go(SignInPage.routeLocation);
          }
        });
      },
      error: (error, stackTrace) => Text(
        'エラーが発生しました。\n ${error.toString()}',
      ),
      loading: () => const CircularProgressIndicator(
        color: lightSkyBlueColor,
        strokeWidth: 3,
      ),
    );

    return Scaffold(
      body: Center(
        child: asyncValue.when(
          data: (user) {
            buildGlobalProvider();
            return const SizedBox.shrink();
          },
          error: (error, stackTrace) =>
              Text('エラーが発生しました。\n ${error.toString()}'),
          loading: () => const CircularProgressIndicator(
            color: lightSkyBlueColor,
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }

  Widget buildGlobalProvider() {
    return Consumer(
      builder: (context, ref, _) {
        return const SizedBox.shrink();
      },
    );
  }
}
