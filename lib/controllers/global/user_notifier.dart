import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/infrastructure/auth/auth_repository_impl.dart';
import 'package:serene_track/infrastructure/user/user_repository_impl.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/repository/auth/auth_repository.dart';
import 'package:serene_track/repository/user/user_repository.dart';
import 'package:serene_track/utils/preferences_manager.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default('') String accessToken,
    @Default('') String tokenType,
    @Default(User()) User user,
    @Default(false) bool isAuthenticated,
    @Default(false) bool initialized,
    @Default(false) bool isLoading,
  }) = _UserState;
  UserState._();
}

final userProvider = StateNotifierProvider<UserController, UserState>(
    (ref) => UserController(ref: ref));

class UserController extends StateNotifier<UserState> {
  UserController({required ref})
      : _ref = ref,
        super(UserState()) {
    _init();
  }

  final StateNotifierProviderRef<UserController, UserState> _ref;

  late final AuthRepository authRepository = _ref.read(authRepositoryProvider);
  late final UserRepository userRepository = _ref.read(userRepositoryProvider);

  User? get currentUser => state.user;
  bool? get getAuthenticated => state.isAuthenticated;

  Future<void> _init() async {
    final accessToken = await PreferencesManager().getAccessToken;
    final tokenType = await PreferencesManager().getTokenType;
    state = state.copyWith(
      accessToken: accessToken,
      tokenType: tokenType,
      initialized: true,
      isAuthenticated: false,
    );
    await fetchUser();
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    String res = failureSignIn;
    if (email.isNotEmpty && password.isNotEmpty) {
      state = state.copyWith(isLoading: true);
      final result =
          await authRepository.signIn(email: email, password: password);
      result.when(
        success: (data) {
          state = state.copyWith(
            isLoading: false,
            accessToken: data['access_token'],
            tokenType: data['token_type'],
          );
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
          return res;
        },
      );
      res = successRes;
    } else {
      res = validationRes;
    }
    return res;
  }

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    String res = failureSignUp;
    if (email.isNotEmpty && password.isNotEmpty) {
      state = state.copyWith(isLoading: true);
      final result =
          await authRepository.signUp(email: email, password: password);
      result.when(
        success: (data) {
          state = state.copyWith(
            isLoading: false,
            accessToken: data['access_token'],
            tokenType: data['token_type'],
          );
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
          return res;
        },
      );
      res = successRes;
    } else {
      res = validationRes;
    }
    return res;
  }

  Future<String> fetchUser() async {
    String res = userNull;
    while (!state.initialized) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    state = state.copyWith(isLoading: true);
    if (state.accessToken.isNotEmpty && state.tokenType.isNotEmpty) {
      final result = await userRepository.fetchUser(
        accessToken: state.accessToken,
        tokenType: state.tokenType,
      );
      result.when(
        success: (user) {
          if (user == null) {
            return;
          }
          state = state.copyWith(
            isLoading: false,
            user: user,
            isAuthenticated: true,
          );
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
          return res;
        },
      );
      await setToken(
        accessToken: state.accessToken,
        tokenType: state.tokenType,
      );
      res = successRes;
    }
    return res;
  }

  Future<void> setToken({
    required String accessToken,
    required String tokenType,
  }) async {
    await PreferencesManager().setAccessToken(accessToken: accessToken);
    await PreferencesManager().setTokenType(tokenType: tokenType);
  }

  Future<void> signOut() async {
    await PreferencesManager().setIsLogin(isLogin: false);
    await PreferencesManager().deleteAccessToken();
    await PreferencesManager().deleteTokenType();
    state = state.copyWith(isAuthenticated: false);
  }

  Future<void> updateHealthDataIntegrationStatus(
      bool healthDataIntegrationStatus) async {
    User user = User(healthDataIntegrationStatus: healthDataIntegrationStatus);
    state = state.copyWith(user: user);
  }
}
