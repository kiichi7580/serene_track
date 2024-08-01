import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/bottom_navigation/provider/bottom_navigation_notifier.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/view/account_page/account_page.dart';
import 'package:serene_track/view/montring_page/montring_page.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavigationNotifierProvider);
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: backGroundColor.withAlpha(220),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        onTap: (int newIndex) {
          ref
              .read(bottomNavigationNotifierProvider.notifier)
              .setIndex(newIndex);
          switch (ref.watch(bottomNavigationNotifierProvider)) {
            case 0:
              context.go(TodoPage.routeLocation);
            case 1:
              context.go(MontringPage.routeLocation);
            case 2:
              context.go(AccountPage.routeLocation);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_task,
              color: index == 0 ? selectedColor : unselectedColor,
            ),
            label: taskTx,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics,
              color: index == 1 ? selectedColor : unselectedColor,
            ),
            label: montringTx,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: index == 2 ? selectedColor : unselectedColor,
            ),
            label: accountTx,
          ),
        ],
      ),
    );
  }
}
