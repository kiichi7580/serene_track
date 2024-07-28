import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/utils/access_token_manager.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(false) bool isAuthenticated,
    @Default(User()) User user,
  }) = _UserState;
  UserState._();
}

final userProvider =
    StateNotifierProvider<UserController, UserState>((ref) => UserController());

class UserController extends StateNotifier<UserState> {
  UserController() : super(UserState()) {
    _init();
  }

  User? get currentUser => state.user;

  Future<void> _init() async {}

  Future<void> fetchUserData(User fetchData) async {
    state = state.copyWith(user: fetchData, isAuthenticated: true);
  }

  Future<void> logOut() async {
    await AccessTokenManager().deleteAccessToken();
    state = state.copyWith(isAuthenticated: false);
  }

  void updateHealthDataIntegrationStatus(
    bool healthDataIntegrationStatus,
  ) {
    User user = User(healthDataIntegrationStatus: healthDataIntegrationStatus);
    state = state.copyWith(user: user);
  }
}
