import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/auth_state.dart';
import 'package:serene_track/model/user.dart';

part 'user_controller.freezed.dart';

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
    // fetchUserData();
  }

  User? get currentUser => state.user;

  Future<void> fetchUserData(User fetchData) async {
    state = state.copyWith(user: fetchData, isAuthenticated: true);
  }

  // Future<void> logOut(AuthState token) {
  //   state = state.copyWith(isAuthenticated: false);
  // }
}
