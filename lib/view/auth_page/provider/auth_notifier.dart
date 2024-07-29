import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/dio_notifier.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/utils/preferences_manager.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory AuthState({
    @Default('') String accessToken,
    @Default('') String tokenType,
    @Default('') String error,
    @Default(false) bool isLoading,
    @Default(false) bool initialized,
  }) = _AuthState;
  AuthState._();
}

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthController(dio: dio);
});

class AuthController extends StateNotifier<AuthState> {
  AuthController({
    required Dio dio,
  })  : _dio = dio,
        super(AuthState()) {
    _init();
  }

  final Dio _dio;

  Future<void> _init() async {
    final accessToken = await PreferencesManager().getAccessToken;
    final tokenType = await PreferencesManager().getTokenType;
    state = state.copyWith(
      accessToken: accessToken,
      tokenType: tokenType,
      initialized: true,
    );
  }

  Future<String> signIn(String email, String password) async {
    String res = failureSignIn;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        state = state.copyWith(isLoading: true);
        final response = await _dio.post('/user/sign_in',
            data: {'email': email, 'password': password});
        state = state.copyWith(
          isLoading: false,
          accessToken: response.data['access_token'],
          tokenType: response.data['token_type'],
        );
        res = successRes;
      } else {
        res = validationRes;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      res = e.toString();
    }
    return res;
  }

  Future<String> signUp(String email, String password) async {
    String res = failureSignUp;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        state = state.copyWith(isLoading: true);
        final response = await _dio.post('/user/sign_up',
            data: {'email': email, 'password': password});
        state = state.copyWith(
          isLoading: false,
          accessToken: response.data['access_token'],
          tokenType: response.data['token_type'],
        );
        res = successRes;
      } else {
        res = validationRes;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      res = e.toString();
    }
    return res;
  }

  Future<User?> getUser() async {
    while (!state.initialized) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    User? user;
    try {
      state = state.copyWith(isLoading: true);
      final response = await _dio.get('/user/',
          options: Options(
            headers: {
              'Authorization': '${state.tokenType} ${state.accessToken}'
            },
          ));
      user = User.fromJson(response.data);
      await PreferencesManager().setAccessToken(accessToken: state.accessToken);
      await PreferencesManager().setTokenType(tokenType: state.tokenType);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
    return user;
  }
}
