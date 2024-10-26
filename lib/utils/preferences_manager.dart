import 'dart:convert';

import 'package:serene_track/model/src/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _isFirstLaunchAfterInstallKey = '_isFirstLaunchAfterInstall';
const String _isLoginKey = 'isLogin';
const String _accessTokenKey = 'accessToken';
const String _tokenTypeKey = 'tokenType';
const String _todoNotificationsKey = 'todo_notifications';

class PreferencesManager {
  factory PreferencesManager() {
    return _incessance;
  }

  PreferencesManager._internal();
  static late SharedPreferences _preferences;
  static final PreferencesManager _incessance = PreferencesManager._internal();

  Future<void> set(SharedPreferences preferences) async =>
      _preferences = preferences;

  Future<bool> get isFirstLaunchAfterInstall async {
    return _preferences.getBool(_isFirstLaunchAfterInstallKey) ?? true;
  }

  Future<void> setIsFirstLaunchAfterInstall({
    required bool isFirstLaunchAfterInstall,
  }) async {
    await _preferences.setBool(
        _isFirstLaunchAfterInstallKey, isFirstLaunchAfterInstall);
  }

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

  Future<List<Todo>> get getTodoNotifications async {
    List<String> stringList =
        _preferences.getStringList(_todoNotificationsKey) ?? [];
    return stringList
        .map((string) => Todo.fromJson(jsonDecode(string)))
        .toList();
  }

  Future<void> setTodoNotifications({
    required List<Todo> todoNotifications,
  }) async {
    List<String> stringList = todoNotifications
        .map((notification) => jsonEncode(notification.toJson()))
        .toList();
    await _preferences.setStringList(_todoNotificationsKey, stringList);
  }
}
