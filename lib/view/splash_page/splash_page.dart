import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/gen/assets.gen.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});
  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  Assets.images.icons.sereneTrackIcon.path,
                ),
              ),
            ),
            buildGlobalProvider(),
          ],
        ),
      ),
    );
  }

  Widget buildGlobalProvider() {
    return Consumer(
      builder: (context, ref, _) {
        ref.watch(userProvider);
        return const SizedBox.shrink();
      },
    );
  }
}
