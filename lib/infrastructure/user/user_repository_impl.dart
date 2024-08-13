import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/controllers/global/dio_notifier.dart';
import 'package:serene_track/model/enum/result.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/repository/user/user_repository.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepositoryImpl(ref));

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(ProviderRef<UserRepository> ref)
      : _dio = ref.watch(dioProvider);

  final Dio _dio;

  @override
  Future<Result<User?>> fetchUser({
    required String accessToken,
    required String tokenType,
  }) async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      User? user;
      final response = await _dio.get('/user/',
          options: Options(
            headers: {'Authorization': '$tokenType $accessToken'},
          ));
      user = User.fromJson(response.data);
      return user;
    });
  }

  @override
  Future<Result<User>> updateUser({
    required String accessToken,
    required String tokenType,
    required User user,
    required FormData formData,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.put(
        '/user/${user.id}',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
        data: formData,
      );

      if (response.statusCode == 204) {
        return user;
      } else if (response.data != null) {
        user = User.fromJson(response.data);
        return user;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<Result<User>> updateHealthDataIntegrationStatus({
    required String accessToken,
    required String tokenType,
    required User user,
    required FormData formData,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.put(
        '/user/health_care/${user.id}',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
        data: formData,
      );

      if (response.statusCode == 204) {
        return user;
      } else if (response.data != null) {
        user = User.fromJson(response.data);
        return user;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}
