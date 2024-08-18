import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/infrastructure/todo/todo_repository_impl.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/repository/todo/todo_repository.dart';

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
    required String categoryId,
  }) async {
    String res = failureCreate;
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty) {
      state = state.copyWith(isLoading: true);
      final formData = FormData.fromMap({
        'title': title,
        'description': description,
        'complete': completed,
        'category_id': categoryId,
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
    required String categoryId,
  }) async {
    String res = failureUpDate;
    state = state.copyWith(isLoading: true);
    if (_userNotifier.accessToken.isNotEmpty &&
        _userNotifier.tokenType.isNotEmpty &&
        _userNotifier.user.id != 0) {
      final formData = FormData.fromMap({
        'title': title,
        'description': description,
        'complete': completed,
        'category_id': categoryId,
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
}
