import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/component/bottom_navigation/bottom_navigation.dart';
import 'package:serene_track/view/account_page/account_page.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/auth_page/sign_up_page/sign_up_page.dart';
import 'package:serene_track/view/montring_page/montring_page.dart';
import 'package:serene_track/view/todo_page/add_todo_page.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

final appRouter = GoRouter(
  initialLocation: '/sign_up',
  routes: [
    GoRoute(
      path: '/sign_up',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SignUpPage(),
      ),
    ),
    GoRoute(
      path: '/sign_in',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SignInPage(),
      ),
    ),
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return BottomNavigation(child: child);
      },
      routes: [
        GoRoute(
          path: '/todo',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TodoPage(),
          ),
        ),
        GoRoute(
          path: '/add_todo',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AddTodoPage(),
          ),
        ),
        GoRoute(
          path: '/montring',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MontringPage(),
          ),
        ),
        GoRoute(
          path: '/account',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AccountPage(),
          ),
        ),
      ],
    ),
  ],
);
