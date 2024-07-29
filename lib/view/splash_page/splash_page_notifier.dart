import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/utils/preferences_manager.dart';

part 'splash_page_notifier.freezed.dart';

@freezed
class SplashPageState with _$SplashPageState {
  const factory SplashPageState({
    @Default(false) bool isLogin,
  }) = _SplashPageState;
}

final splashPageProvider =
    StateNotifierProvider.autoDispose<SplashPageController, SplashPageState>(
        (ref) {
  final isAuthenticated =
      ref.watch(userProvider.select((s) => s.isAuthenticated));
  return SplashPageController(isAuthenticated: isAuthenticated);
});

class SplashPageController extends StateNotifier<SplashPageState> {
  SplashPageController({
    required bool isAuthenticated,
  })  : _isAuthenticated = isAuthenticated,
        super(const SplashPageState()) {
    init();
  }

  final bool _isAuthenticated;

  Future<void> init() async {
    if (_isAuthenticated && mounted) {
      final isLogin = await PreferencesManager().isLogin;
      state = state.copyWith(isLogin: isLogin);
    }
  }
}
