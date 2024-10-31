import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/utils/preferences_manager.dart';

final accessToken = PreferencesManager().getAccessToken;

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 4),
    ),
  );
});
