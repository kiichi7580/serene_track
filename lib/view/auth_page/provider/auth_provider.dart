import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:serene_track/constant/constants.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/model/src/auth_state.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/utils/access_token_manager.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: kBaseUrl));
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(dioProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Dio dio;

  AuthNotifier(this.dio) : super(const AuthState()) {
    _init();
  }

  Future<void> _init() async {
    String? token = await AccessTokenManager().getAccessToken();
    // state = state.copyWith(accessToken: token!);
  }

  Future<String> signIn(String email, String password) async {
    String res = failureSignIn;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        state = state.copyWith(isLoading: true);
        final response = await dio.post('/user/sign_in',
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
        final response = await dio.post('/user/sign_up',
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

  Future<User?> getUser(WidgetRef ref) async {
    User? user;
    try {
      state = state.copyWith(isLoading: true);
      final response = await dio.get('/user/',
          options: Options(
            headers: {
              'Authorization': '${state.tokenType} ${state.accessToken}'
            },
          ));
      user = User.fromJson(response.data);
      await ref.read(userProvider.notifier).fetchUserData(user);
      await AccessTokenManager().saveAccessToken(state.accessToken);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
    return user;
  }
}
