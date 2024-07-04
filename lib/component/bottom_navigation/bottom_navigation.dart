import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/component/bottom_navigation/provider/bottom_navigation_notifier.dart';
import 'package:serene_track/constant/colors.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavigationNotifierProvider);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        backgroundColor: backGroundColor,
        onTap: (int newIndex) {
          ref
              .read(bottomNavigationNotifierProvider.notifier)
              .setIndex(newIndex);
          switch (ref.watch(bottomNavigationNotifierProvider)) {
            case 0:
              context.go('/todo');
            case 1:
              context.go('/montring');
            case 2:
              context.go('/account');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_task,
              color: index == 0 ? selectedColor : unselectedColor,
            ),
            label: 'タスク',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics,
              color: index == 1 ? selectedColor : unselectedColor,
            ),
            label: 'モニタリング',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: index == 2 ? selectedColor : unselectedColor,
            ),
            label: 'アカウント',
          ),
        ],
      ),
    );
  }
}
