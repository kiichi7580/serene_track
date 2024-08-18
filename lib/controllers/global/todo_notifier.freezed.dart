// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoState {
  List<Todo> get todos => throw _privateConstructorUsedError;
  Todo get selectedTodo => throw _privateConstructorUsedError;
  int get selectedTodoIndex => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call(
      {List<Todo> todos,
      Todo selectedTodo,
      int selectedTodoIndex,
      int tabIndex,
      bool editMode,
      bool isLoading});

  $TodoCopyWith<$Res> get selectedTodo;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? selectedTodo = null,
    Object? selectedTodoIndex = null,
    Object? tabIndex = null,
    Object? editMode = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      selectedTodo: null == selectedTodo
          ? _value.selectedTodo
          : selectedTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      selectedTodoIndex: null == selectedTodoIndex
          ? _value.selectedTodoIndex
          : selectedTodoIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res> get selectedTodo {
    return $TodoCopyWith<$Res>(_value.selectedTodo, (value) {
      return _then(_value.copyWith(selectedTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoStateImplCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$$TodoStateImplCopyWith(
          _$TodoStateImpl value, $Res Function(_$TodoStateImpl) then) =
      __$$TodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Todo> todos,
      Todo selectedTodo,
      int selectedTodoIndex,
      int tabIndex,
      bool editMode,
      bool isLoading});

  @override
  $TodoCopyWith<$Res> get selectedTodo;
}

/// @nodoc
class __$$TodoStateImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateImpl>
    implements _$$TodoStateImplCopyWith<$Res> {
  __$$TodoStateImplCopyWithImpl(
      _$TodoStateImpl _value, $Res Function(_$TodoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? selectedTodo = null,
    Object? selectedTodoIndex = null,
    Object? tabIndex = null,
    Object? editMode = null,
    Object? isLoading = null,
  }) {
    return _then(_$TodoStateImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      selectedTodo: null == selectedTodo
          ? _value.selectedTodo
          : selectedTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      selectedTodoIndex: null == selectedTodoIndex
          ? _value.selectedTodoIndex
          : selectedTodoIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TodoStateImpl extends _TodoState {
  _$TodoStateImpl(
      {final List<Todo> todos = const [],
      this.selectedTodo = const Todo(),
      this.selectedTodoIndex = 0,
      this.tabIndex = 0,
      this.editMode = false,
      this.isLoading = false})
      : _todos = todos,
        super._();

  final List<Todo> _todos;
  @override
  @JsonKey()
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @JsonKey()
  final Todo selectedTodo;
  @override
  @JsonKey()
  final int selectedTodoIndex;
  @override
  @JsonKey()
  final int tabIndex;
  @override
  @JsonKey()
  final bool editMode;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TodoState(todos: $todos, selectedTodo: $selectedTodo, selectedTodoIndex: $selectedTodoIndex, tabIndex: $tabIndex, editMode: $editMode, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.selectedTodo, selectedTodo) ||
                other.selectedTodo == selectedTodo) &&
            (identical(other.selectedTodoIndex, selectedTodoIndex) ||
                other.selectedTodoIndex == selectedTodoIndex) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_todos),
      selectedTodo,
      selectedTodoIndex,
      tabIndex,
      editMode,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      __$$TodoStateImplCopyWithImpl<_$TodoStateImpl>(this, _$identity);
}

abstract class _TodoState extends TodoState {
  factory _TodoState(
      {final List<Todo> todos,
      final Todo selectedTodo,
      final int selectedTodoIndex,
      final int tabIndex,
      final bool editMode,
      final bool isLoading}) = _$TodoStateImpl;
  _TodoState._() : super._();

  @override
  List<Todo> get todos;
  @override
  Todo get selectedTodo;
  @override
  int get selectedTodoIndex;
  @override
  int get tabIndex;
  @override
  bool get editMode;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
