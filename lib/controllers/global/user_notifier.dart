import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/infrastructure/auth/auth_repository_impl.dart';
import 'package:serene_track/infrastructure/user/user_repository_impl.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/repository/auth/auth_repository.dart';
import 'package:serene_track/repository/user/user_repository.dart';
import 'package:serene_track/utils/preferences_manager.dart';
import 'package:serene_track/view/splash_page/splash_page_notifier.dart';

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
  bool get getLoading => state.isLoading;

  Future<void> _init() async {
    final accessToken = await PreferencesManager().getAccessToken;
    final tokenType = await PreferencesManager().getTokenType;
    state = state.copyWith(
      accessToken: accessToken,
      tokenType: tokenType,
      initialized: true,
      isAuthenticated: false,
    );
    String res = await fetchUser();
    if (res == successRes) {
      return;
    } else {
      _ref.read(splashPageProvider.notifier).changeIsLogin(false);
    }
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
    if (state.accessToken.isNotEmpty && state.tokenType.isNotEmpty) {
      state = state.copyWith(isLoading: true);
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
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
      await setToken(
        accessToken: state.accessToken,
        tokenType: state.tokenType,
      );
    }
    return res;
  }

  Future<String> updateUser({
    required String name,
    required String shortTermGoal,
    required String longTermGoal,
  }) async {
    String res = userNull;
    state = state.copyWith(isLoading: true);
    if (state.accessToken.isNotEmpty &&
        state.tokenType.isNotEmpty &&
        state.user.id != 0) {
      final formData = FormData.fromMap({
        'name': name,
        'short_term_goal': shortTermGoal,
        'long_term_goal': longTermGoal,
      });
      final result = await userRepository.updateUser(
        accessToken: state.accessToken,
        tokenType: state.tokenType,
        user: state.user,
        formData: formData,
      );
      result.when(
        success: (user) {
          state = state.copyWith(
            isLoading: false,
            user: user,
          );
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  Future<String> updateUserIcon(String photoUrl) async {
    String res = failureUpDate;
    state = state.copyWith(isLoading: true);
    if (state.accessToken.isNotEmpty &&
        state.tokenType.isNotEmpty &&
        state.user.id != 0) {
      final formData = FormData.fromMap({
        'photo_url': photoUrl,
      });
      final result = await userRepository.updateUserIcon(
        accessToken: state.accessToken,
        tokenType: state.tokenType,
        user: state.user,
        formData: formData,
      );
      result.when(
        success: (user) {
          state = state.copyWith(
            isLoading: false,
            user: user,
          );
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  Future<void> updateHealthDataIntegrationStatus(
      bool healthDataIntegrationStatus) async {
    state = state.copyWith(isLoading: true);
    if (state.accessToken.isNotEmpty &&
        state.tokenType.isNotEmpty &&
        state.user.id != 0) {
      final formData = FormData.fromMap({
        'health_data_integration_status': healthDataIntegrationStatus,
      });
      final result = await userRepository.updateHealthDataIntegrationStatus(
        accessToken: state.accessToken,
        tokenType: state.tokenType,
        user: state.user,
        formData: formData,
      );
      result.when(
        success: (user) {
          state = state.copyWith(
            isLoading: false,
            user: user,
          );
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          throw ('Error: ${error.toString()}');
        },
      );
    }
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
}
