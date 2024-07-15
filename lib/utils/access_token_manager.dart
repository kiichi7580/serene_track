import 'package:shared_preferences/shared_preferences.dart';

class AccessTokenManager {
  static const _accessTokenKey = 'accessToken';

  Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_accessTokenKey, token);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_accessTokenKey);
  }
}
