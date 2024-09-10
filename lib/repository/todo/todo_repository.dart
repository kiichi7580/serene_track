import 'package:dio/dio.dart';
import 'package:serene_track/model/enum/result.dart';
import 'package:serene_track/model/src/todo.dart';

abstract class TodoRepository {
  Future<Result<Todo?>> createTodo({
    required String accessToken,
    required String tokenType,
    required FormData formData,
  });

  Future<Result<List<Todo>?>> fetchTodo({
    required String accessToken,
    required String tokenType,
  });

  Future<Result<Todo>> updateTodo({
    required String accessToken,
    required String tokenType,
    required FormData formData,
    required Todo todo,
  });

  Future<Result<Todo>> deleteTodo({
    required String accessToken,
    required String tokenType,
    required Todo todo,
  });

  Future<Result<Todo>> offTodoNotification({
    required String accessToken,
    required String tokenType,
    required FormData formData,
    required Todo todo,
  });
}
