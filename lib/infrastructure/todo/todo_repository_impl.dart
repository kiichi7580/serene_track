import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/dio_notifier.dart';
import 'package:serene_track/model/src/result.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/repository/todo/todo_repository.dart';

final todoRepositoryProvider =
    Provider<TodoRepository>((ref) => TodoRepositoryImpl(ref));

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(ProviderRef<TodoRepository> ref)
      : _dio = ref.watch(dioProvider);

  final Dio _dio;

  @override
  Future<Result<Todo?>> createTodo({
    required String accessToken,
    required String tokenType,
    required FormData formData,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.post(
        '/todo/',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
        data: formData,
      );
      if (response.statusCode == 204) {
        return null;
      } else if (response.data != null) {
        Todo todo = Todo.fromJson(response.data);
        return todo;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<Result<List<Todo>?>> fetchTodo({
    required String accessToken,
    required String tokenType,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.get('/todo/',
          options: Options(
            headers: {'Authorization': '$tokenType $accessToken'},
          ));
      if (response.data.isEmpty) {
        return [];
      }
      final todos =
          List<Todo>.from(response.data.map((todo) => Todo.fromJson(todo)));
      return todos;
    });
  }

  @override
  Future<Result<Todo>> updateTodo({
    required String accessToken,
    required String tokenType,
    required Todo todo,
    required FormData formData,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.put(
        '/todo/${todo.id}',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
        data: formData,
      );

      if (response.statusCode == 204) {
        return todo;
      } else if (response.data != null) {
        todo = Todo.fromJson(response.data);
        return todo;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<Result<Todo>> deleteTodo({
    required String accessToken,
    required String tokenType,
    required Todo todo,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.delete(
        '/todo/${todo.id}',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
      );
      if (response.statusCode == 204) {
        return todo;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<Result<Todo>> changeCompleteStatus({
    required String accessToken,
    required String tokenType,
    required Todo todo,
    required FormData formData,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.put(
        '/todo/complete/${todo.id}',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
        data: formData,
      );

      if (response.statusCode == 204) {
        return todo;
      } else if (response.data != null) {
        todo = Todo.fromJson(response.data);
        return todo;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<Result<Todo>> offTodoNotification({
    required String accessToken,
    required String tokenType,
    required Todo todo,
    required FormData formData,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.put(
        '/todo/notification_time/${todo.id}',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
        data: formData,
      );
      if (response.statusCode == 204) {
        return todo;
      } else if (response.data != null) {
        todo = Todo.fromJson(response.data);
        return todo;
      } else {
        throw Exception('Unexpected response format');
      }
    });
  }

  @override
  Future<Result<String>> deleteTodos({
    required String accessToken,
    required String tokenType,
  }) {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final response = await _dio.delete(
        '/todos/',
        options: Options(
          headers: {'Authorization': '$tokenType $accessToken'},
        ),
      );
      if (response.statusCode == 204) {
        return successDelete;
      } else {
        return Exception('Unexpected response format').toString();
      }
    });
  }
}
