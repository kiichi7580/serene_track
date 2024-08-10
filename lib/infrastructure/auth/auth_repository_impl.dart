import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/controllers/global/dio_notifier.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/model/enum/result.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/repository/auth/auth_repository.dart';
import 'dart:convert' as convert;

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(ProviderRef<AuthRepository> ref)
      : _dio = ref.watch(dioProvider),
        _user = ref.read(userProvider.notifier);

  final Dio _dio;
  // ignore: prefer_typing_uninitialized_variables
  final _user;

  @override
  User? get currentUser => _user.currentUser;

  @override
  Future<Result<Map<String, dynamic>>> signUp({
    required String email,
    required String password,
  }) async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      Map<String, dynamic> tokenMap = {};
      final response = await _dio
          .post('/user/sign_up', data: {'email': email, 'password': password});
      tokenMap =
          convert.json.decode(response.toString()) as Map<String, dynamic>;
      return tokenMap;
    });
  }

  @override
  Future<Result<Map<String, dynamic>>> signIn({
    required String email,
    required String password,
  }) async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      Map<String, dynamic> tokenMap = {};
      final response = await _dio
          .post('/user/sign_in', data: {'email': email, 'password': password});
      tokenMap =
          convert.json.decode(response.toString()) as Map<String, dynamic>;
      return tokenMap;
    });
  }

  @override
  Future<void> signOut() async {
    await _user.signOut();
  }
}
