// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_todo_tab_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkTodoTabState {
  Todo get workTodo => throw _privateConstructorUsedError;
  List<Todo> get workTodos => throw _privateConstructorUsedError;
  List<bool> get isSelectedList => throw _privateConstructorUsedError;
  List<bool> get completeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkTodoTabStateCopyWith<WorkTodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkTodoTabStateCopyWith<$Res> {
  factory $WorkTodoTabStateCopyWith(
          WorkTodoTabState value, $Res Function(WorkTodoTabState) then) =
      _$WorkTodoTabStateCopyWithImpl<$Res, WorkTodoTabState>;
  @useResult
  $Res call(
      {Todo workTodo,
      List<Todo> workTodos,
      List<bool> isSelectedList,
      List<bool> completeList});

  $TodoCopyWith<$Res> get workTodo;
}

/// @nodoc
class _$WorkTodoTabStateCopyWithImpl<$Res, $Val extends WorkTodoTabState>
    implements $WorkTodoTabStateCopyWith<$Res> {
  _$WorkTodoTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTodo = null,
    Object? workTodos = null,
    Object? isSelectedList = null,
    Object? completeList = null,
  }) {
    return _then(_value.copyWith(
      workTodo: null == workTodo
          ? _value.workTodo
          : workTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      workTodos: null == workTodos
          ? _value.workTodos
          : workTodos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isSelectedList: null == isSelectedList
          ? _value.isSelectedList
          : isSelectedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      completeList: null == completeList
          ? _value.completeList
          : completeList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res> get workTodo {
    return $TodoCopyWith<$Res>(_value.workTodo, (value) {
      return _then(_value.copyWith(workTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkTodoTabStateImplCopyWith<$Res>
    implements $WorkTodoTabStateCopyWith<$Res> {
  factory _$$WorkTodoTabStateImplCopyWith(_$WorkTodoTabStateImpl value,
          $Res Function(_$WorkTodoTabStateImpl) then) =
      __$$WorkTodoTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Todo workTodo,
      List<Todo> workTodos,
      List<bool> isSelectedList,
      List<bool> completeList});

  @override
  $TodoCopyWith<$Res> get workTodo;
}

/// @nodoc
class __$$WorkTodoTabStateImplCopyWithImpl<$Res>
    extends _$WorkTodoTabStateCopyWithImpl<$Res, _$WorkTodoTabStateImpl>
    implements _$$WorkTodoTabStateImplCopyWith<$Res> {
  __$$WorkTodoTabStateImplCopyWithImpl(_$WorkTodoTabStateImpl _value,
      $Res Function(_$WorkTodoTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTodo = null,
    Object? workTodos = null,
    Object? isSelectedList = null,
    Object? completeList = null,
  }) {
    return _then(_$WorkTodoTabStateImpl(
      workTodo: null == workTodo
          ? _value.workTodo
          : workTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      workTodos: null == workTodos
          ? _value._workTodos
          : workTodos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isSelectedList: null == isSelectedList
          ? _value._isSelectedList
          : isSelectedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      completeList: null == completeList
          ? _value._completeList
          : completeList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$WorkTodoTabStateImpl extends _WorkTodoTabState {
  _$WorkTodoTabStateImpl(
      {this.workTodo = const Todo(),
      final List<Todo> workTodos = const [],
      final List<bool> isSelectedList = const [],
      final List<bool> completeList = const []})
      : _workTodos = workTodos,
        _isSelectedList = isSelectedList,
        _completeList = completeList,
        super._();

  @override
  @JsonKey()
  final Todo workTodo;
  final List<Todo> _workTodos;
  @override
  @JsonKey()
  List<Todo> get workTodos {
    if (_workTodos is EqualUnmodifiableListView) return _workTodos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workTodos);
  }

  final List<bool> _isSelectedList;
  @override
  @JsonKey()
  List<bool> get isSelectedList {
    if (_isSelectedList is EqualUnmodifiableListView) return _isSelectedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isSelectedList);
  }

  final List<bool> _completeList;
  @override
  @JsonKey()
  List<bool> get completeList {
    if (_completeList is EqualUnmodifiableListView) return _completeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completeList);
  }

  @override
  String toString() {
    return 'WorkTodoTabState(workTodo: $workTodo, workTodos: $workTodos, isSelectedList: $isSelectedList, completeList: $completeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkTodoTabStateImpl &&
            (identical(other.workTodo, workTodo) ||
                other.workTodo == workTodo) &&
            const DeepCollectionEquality()
                .equals(other._workTodos, _workTodos) &&
            const DeepCollectionEquality()
                .equals(other._isSelectedList, _isSelectedList) &&
            const DeepCollectionEquality()
                .equals(other._completeList, _completeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      workTodo,
      const DeepCollectionEquality().hash(_workTodos),
      const DeepCollectionEquality().hash(_isSelectedList),
      const DeepCollectionEquality().hash(_completeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkTodoTabStateImplCopyWith<_$WorkTodoTabStateImpl> get copyWith =>
      __$$WorkTodoTabStateImplCopyWithImpl<_$WorkTodoTabStateImpl>(
          this, _$identity);
}

abstract class _WorkTodoTabState extends WorkTodoTabState {
  factory _WorkTodoTabState(
      {final Todo workTodo,
      final List<Todo> workTodos,
      final List<bool> isSelectedList,
      final List<bool> completeList}) = _$WorkTodoTabStateImpl;
  _WorkTodoTabState._() : super._();

  @override
  Todo get workTodo;
  @override
  List<Todo> get workTodos;
  @override
  List<bool> get isSelectedList;
  @override
  List<bool> get completeList;
  @override
  @JsonKey(ignore: true)
  _$$WorkTodoTabStateImplCopyWith<_$WorkTodoTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
