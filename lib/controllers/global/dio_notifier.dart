import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  const baseUrl = String.fromEnvironment('baseUrl');
  if (baseUrl.isEmpty) {
    throw AssertionError('baseUrl is not set');
  }
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 4),
    ),
  );
});
