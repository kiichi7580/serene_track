import 'package:shared_preferences/shared_preferences.dart';

const _isLoginKey = 'isLogin';
const _accessTokenKey = 'accessToken';
const _tokenTypeKey = 'tokenType';

class PreferencesManager {
  factory PreferencesManager() {
    return _incessance;
  }
  PreferencesManager._internal();
  static late SharedPreferences _preferences;
  static final PreferencesManager _incessance = PreferencesManager._internal();

  Future<void> set(SharedPreferences preferences) async =>
      _preferences = preferences;

  Future<bool> get isLogin async {
    return _preferences.getBool(_isLoginKey) ?? false;
  }

  Future<void> setIsLogin({
    required bool isLogin,
  }) async {
    await _preferences.setBool(_isLoginKey, isLogin);
  }

  Future<String> get getAccessToken async {
    return _preferences.getString(_accessTokenKey) ?? '';
  }

  Future<void> setAccessToken({
    required String accessToken,
  }) async {
    await _preferences.setString(_accessTokenKey, accessToken);
  }

  Future<void> deleteAccessToken() async {
    await _preferences.remove(_accessTokenKey);
  }

  Future<String> get getTokenType async {
    return _preferences.getString(_tokenTypeKey) ?? '';
  }

  Future<void> setTokenType({
    required String tokenType,
  }) async {
    await _preferences.setString(_tokenTypeKey, tokenType);
  }

  Future<void> deleteTokenType() async {
    await _preferences.remove(_tokenTypeKey);
  }
}
