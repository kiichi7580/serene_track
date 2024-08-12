import 'package:dio/dio.dart';
import 'package:serene_track/model/enum/result.dart';
import 'package:serene_track/model/src/user.dart';

abstract class UserRepository {
  Future<Result<User?>> fetchUser({
    required String accessToken,
    required String tokenType,
  });

  Future<Result<User>> updateUser({
    required String accessToken,
    required String tokenType,
    required User user,
    required FormData formData,
  });

  Future<void> deleteUser();
}
