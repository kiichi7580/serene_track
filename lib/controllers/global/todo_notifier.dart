import 'package:dio/dio.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/infrastructure/todo/todo_repository_impl.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/repository/todo/todo_repository.dart';
import 'package:serene_track/utils/notification/todo_notifications.dart';
import 'package:serene_track/utils/preferences_manager.dart';

part 'todo_notifier.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    @Default([]) List<Todo> todos,
    @Default(Todo()) Todo selectedTodo,
    @Default(0) int selectedTodoIndex,
    @Default(0) int tabIndex,
    @Default(false) bool editMode,
    @Default(false) bool isLoading,
  }) = _TodoState;
  TodoState._();
}

final todoProvider = StateNotifierProvider<TodoController, TodoState>(
  (ref) {
    final userNotifier = ref.watch(userProvider);
    return TodoController(ref: ref, userNotifier: userNotifier);
  },
  dependencies: [userProvider],
);

class TodoController extends StateNotifier<TodoState> {
  TodoController({
    required ref,
    required UserState userNotifier,
  })  : _ref = ref,
        _userNotifier = userNotifier,
        super(TodoState()) {
    _init();
  }

  final StateNotifierProviderRef<TodoController, TodoState> _ref;
  final UserState _userNotifier;

  late final TodoRepository todoRepository = _ref.read(todoRepositoryProvider);

  Future<void> _init() async {
    String res = await fetchTodo();
    if (res == successRes) {
      return;
    } else {
      throw (res.toString());
    }
  }

  Future<String> createTodo({
    required String title,
    required String description,
    required bool completed,
    required Category categoryId,
    DateTime? notificationTime,
  }) async {
    String res = failureCreate;
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty) {
      state = state.copyWith(isLoading: true);
      String categoryString = EnumToString.convertToString(categoryId);
      final formData = FormData.fromMap({
        'title': title,
        'description': description,
        'complete': completed,
        'category_id': categoryString,
        'notification_time': notificationTime,
      });
      final result = await todoRepository.createTodo(
        accessToken: _userNotifier.accessToken,
        tokenType: _userNotifier.tokenType,
        formData: formData,
      );
      result.when(
        success: (todo) {
          if (todo == null) {
            return;
          }
          add(todo);
          if (todo.notificationTime != null) {
            setTodoNotifications(todo: todo);
          }
          state = state.copyWith(isLoading: false);
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  void add(Todo addTodo) {
    final newList = [...state.todos, addTodo];
    state = state.copyWith(todos: newList);
  }

  Future<String> fetchTodo() async {
    String res = failureRead;
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty) {
      state = state.copyWith(isLoading: true);
      final result = await todoRepository.fetchTodo(
        accessToken: _userNotifier.accessToken,
        tokenType: _userNotifier.tokenType,
      );
      result.when(
        success: (todos) {
          if (todos == null) {
            return;
          }
          sort(todos);
          state = state.copyWith(isLoading: false);
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  void sort(List<Todo> todos) {
    todos.sort((a, b) => a.id.compareTo(b.id));
    state = state.copyWith(todos: todos);
  }

  Future<String> updateTodo({
    required String title,
    required String description,
    required bool completed,
    required Category categoryId,
    DateTime? notificationTime,
  }) async {
    String res = failureUpDate;
    state = state.copyWith(isLoading: true);
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty &&
        _userNotifier.user.id != 0) {
      String categoryString = EnumToString.convertToString(categoryId);
      final formData = FormData.fromMap({
        'title': title,
        'description': description,
        'complete': completed,
        'category_id': categoryString,
        'notification_time': notificationTime,
      });
      final result = await todoRepository.updateTodo(
        accessToken: _userNotifier.accessToken,
        tokenType: _userNotifier.tokenType,
        formData: formData,
        todo: state.selectedTodo,
      );
      result.when(
        success: (todo) {
          update(todo);
          if (todo.notificationTime != null) {
            updateTodoNotifications(updateTodo: todo);
          }
          state = state.copyWith(isLoading: false);
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  void update(Todo updateTodo) {
    final newList = state.todos
        .map((todo) => todo.id == updateTodo.id ? updateTodo : todo)
        .toList();
    state = state.copyWith(todos: newList);
  }

  Future<String> deleteTodo() async {
    String res = failureDelete;
    state = state.copyWith(isLoading: true);
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty &&
        _userNotifier.user.id != 0) {
      final result = await todoRepository.deleteTodo(
        accessToken: _userNotifier.accessToken,
        tokenType: _userNotifier.tokenType,
        todo: state.selectedTodo,
      );
      result.when(
        success: (todo) {
          delete(todo);
          deleteTodoNotifications(deleteTodo: todo);
          state = state.copyWith(isLoading: false);
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  void delete(Todo deleteTodo) {
    final newList =
        state.todos.where((todo) => todo.id != deleteTodo.id).toList();
    state = state.copyWith(todos: newList);
  }

  Future<String> offTodoNotification({
    required DateTime? notificationTime,
  }) async {
    String res = failureUpDate;
    state = state.copyWith(isLoading: true);
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty &&
        _userNotifier.user.id != 0) {
      final formData = FormData.fromMap({
        'notification_time': notificationTime,
      });
      final result = await todoRepository.offTodoNotification(
        accessToken: _userNotifier.accessToken,
        tokenType: _userNotifier.tokenType,
        formData: formData,
        todo: state.selectedTodo,
      );
      result.when(
        success: (todo) {
          update(todo);
          if (todo.notificationTime == null) {
            deleteTodoNotifications(deleteTodo: todo);
          }
          state = state.copyWith(isLoading: false);
          res = successRes;
        },
        failure: (error) {
          state = state.copyWith(isLoading: false);
          res = error.toString();
        },
      );
    }
    return res;
  }

  void changeTabIndex(int tabIndex) {
    state = state.copyWith(tabIndex: tabIndex);
  }

  void changeEditMode() {
    state = state.copyWith(editMode: !state.editMode);
  }

  void setSelectedTodo(Todo selectedTodo) {
    state = state.copyWith(selectedTodo: selectedTodo);
  }

  void setSelectedTodoIndex(int selectedTodoIndex) {
    state = state.copyWith(selectedTodoIndex: selectedTodoIndex);
  }

  Future<void> setTodoNotifications({
    required Todo todo,
  }) async {
    List<Todo> todoNotifications =
        await PreferencesManager().getTodoNotifications;
    todoNotifications.add(todo);
    await PreferencesManager()
        .setTodoNotifications(todoNotifications: todoNotifications);
    await dailyProteinNotifications(todoNotifications);
  }

  Future<void> updateTodoNotifications({
    required Todo updateTodo,
  }) async {
    List<Todo> todoNotifications =
        await PreferencesManager().getTodoNotifications;
    final index =
        todoNotifications.indexWhere((todo) => todo.id == updateTodo.id);

    // 当てはまるindexがない場合、-1の値になる
    if (index != -1) {
      todoNotifications[index] = updateTodo;
    } else {
      todoNotifications.add(updateTodo);
    }
    await PreferencesManager()
        .setTodoNotifications(todoNotifications: todoNotifications);
    await dailyProteinNotifications(todoNotifications);
  }

  Future<void> deleteTodoNotifications({
    required Todo deleteTodo,
  }) async {
    List<Todo> todoNotifications =
        await PreferencesManager().getTodoNotifications;
    todoNotifications.removeWhere((todo) => todo.id == deleteTodo.id);
    await PreferencesManager()
        .setTodoNotifications(todoNotifications: todoNotifications);
    await dailyProteinNotifications(todoNotifications);
  }
}
