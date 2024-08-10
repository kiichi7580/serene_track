import 'package:serene_track/model/enum/result.dart';
import 'package:serene_track/model/src/user.dart';

abstract class AuthRepository {
  User? get currentUser;

  Future<Result<Map<String, dynamic>>> signUp({
    required String email,
    required String password,
  });

  Future<Result<Map<String, dynamic>>> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
