import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/bottom_navigation/bottom_navigation.dart';
import 'package:serene_track/responsive/mobile_screen_layout.dart';
import 'package:serene_track/responsive/responsive_layout.dart';
import 'package:serene_track/responsive/web_screen_layout.dart';
import 'package:serene_track/view/account_page/account_page.dart';
import 'package:serene_track/view/account_edit_page/account_edit_page.dart';
import 'package:serene_track/view/account_setting_page/account_setting_page.dart';
import 'package:serene_track/view/auth_page/sign_in_page/sign_in_page.dart';
import 'package:serene_track/view/auth_page/sign_up_page/sign_up_page.dart';
import 'package:serene_track/view/health_care_page/health_care_app_integration_page.dart';
import 'package:serene_track/view/montring_page/montring_page.dart';
import 'package:serene_track/view/splash_page/splash_page.dart';
import 'package:serene_track/view/todo_add_page/todo_add_page.dart';
import 'package:serene_track/view/todo_edit_page/todo_edit_page.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: SplashPage.routeLocation,
      routes: [
        GoRoute(
          path: SplashPage.routeLocation,
          name: SplashPage.routeName,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: SignUpPage.routeLocation,
          name: SignUpPage.routeName,
          builder: (context, state) {
            return const SignUpPage();
          },
        ),
        GoRoute(
          path: SignInPage.routeLocation,
          name: SignInPage.routeName,
          builder: (context, state) {
            return const SignInPage();
          },
        ),
        GoRoute(
          path: ResponsiveLayout.routeLocation,
          name: ResponsiveLayout.routeName,
          builder: (context, state) {
            return const ResponsiveLayout();
          },
        ),
        GoRoute(
          path: MobileScreenLayout.routeLocation,
          name: MobileScreenLayout.routeName,
          builder: (context, state) {
            return const MobileScreenLayout();
          },
        ),
        GoRoute(
          path: WebScreenLayout.routeLocation,
          name: WebScreenLayout.routeName,
          builder: (context, state) {
            return const WebScreenLayout();
          },
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return BottomNavigation(child: child);
          },
          routes: [
            GoRoute(
              path: TodoPage.routeLocation,
              name: TodoPage.routeName,
              builder: (context, state) {
                return const TodoPage();
              },
            ),
            GoRoute(
              path: TodoAddPage.routeLocation,
              name: TodoAddPage.routeName,
              builder: (context, state) {
                return const TodoAddPage();
              },
            ),
            GoRoute(
              path: TodoEditPage.routeLocation,
              name: TodoEditPage.routeName,
              builder: (context, state) {
                return const TodoEditPage();
              },
            ),
            GoRoute(
              path: MontringPage.routeLocation,
              name: MontringPage.routeName,
              builder: (context, state) {
                return const MontringPage();
              },
            ),
            GoRoute(
              path: AccountPage.routeLocation,
              name: AccountPage.routeName,
              builder: (context, state) {
                return const AccountPage();
              },
            ),
            GoRoute(
              path: AccountSettingPage.routeLocation,
              name: AccountSettingPage.routeName,
              builder: (context, state) {
                return const AccountSettingPage();
              },
            ),
            GoRoute(
              path: AccountEditPage.routeLocation,
              name: AccountEditPage.routeName,
              builder: (context, state) {
                return const AccountEditPage();
              },
            ),
            GoRoute(
              path: HealthCareAppIntegrationPage.routeLocation,
              name: HealthCareAppIntegrationPage.routeName,
              builder: (context, state) {
                return const HealthCareAppIntegrationPage();
              },
            ),
          ],
        ),
      ],
    );
  },
);
