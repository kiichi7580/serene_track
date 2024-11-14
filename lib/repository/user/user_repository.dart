import 'package:dio/dio.dart';
import 'package:serene_track/model/src/result.dart';
import 'package:serene_track/model/src/user.dart';

abstract class UserRepository {
  Future<Result<User?>> fetchUser({
    required String accessToken,
  });

  Future<Result<User>> updateUser({
    required String accessToken,
    required User user,
    required FormData formData,
  });

  Future<Result<User>> updateUserIcon({
    required String accessToken,
    required User user,
    required FormData formData,
  });

  Future<Result<User>> updateHealthDataIntegrationStatus({
    required String accessToken,
    required User user,
    required FormData formData,
  });

  Future<Result<void>> deleteUser({
    required String accessToken,
    required User user,
  });
}
