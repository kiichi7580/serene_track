import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/user_controller.dart';
import 'package:serene_track/model/auth_state.dart';
import 'package:serene_track/model/user.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(dioProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Dio dio;

  AuthNotifier(this.dio) : super(const AuthState());

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
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
    return user;
  }
}
