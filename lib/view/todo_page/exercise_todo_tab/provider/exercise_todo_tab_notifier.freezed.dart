// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_todo_tab_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExerciseTodoTabState {
  Todo get exerciseTodo => throw _privateConstructorUsedError;
  List<Todo> get exerciseTodos => throw _privateConstructorUsedError;
  List<bool> get isSelectedList => throw _privateConstructorUsedError;
  List<bool> get completeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseTodoTabStateCopyWith<ExerciseTodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseTodoTabStateCopyWith<$Res> {
  factory $ExerciseTodoTabStateCopyWith(ExerciseTodoTabState value,
          $Res Function(ExerciseTodoTabState) then) =
      _$ExerciseTodoTabStateCopyWithImpl<$Res, ExerciseTodoTabState>;
  @useResult
  $Res call(
      {Todo exerciseTodo,
      List<Todo> exerciseTodos,
      List<bool> isSelectedList,
      List<bool> completeList});

  $TodoCopyWith<$Res> get exerciseTodo;
}

/// @nodoc
class _$ExerciseTodoTabStateCopyWithImpl<$Res,
        $Val extends ExerciseTodoTabState>
    implements $ExerciseTodoTabStateCopyWith<$Res> {
  _$ExerciseTodoTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseTodo = null,
    Object? exerciseTodos = null,
    Object? isSelectedList = null,
    Object? completeList = null,
  }) {
    return _then(_value.copyWith(
      exerciseTodo: null == exerciseTodo
          ? _value.exerciseTodo
          : exerciseTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      exerciseTodos: null == exerciseTodos
          ? _value.exerciseTodos
          : exerciseTodos // ignore: cast_nullable_to_non_nullable
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
  $TodoCopyWith<$Res> get exerciseTodo {
    return $TodoCopyWith<$Res>(_value.exerciseTodo, (value) {
      return _then(_value.copyWith(exerciseTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseTodoTabStateImplCopyWith<$Res>
    implements $ExerciseTodoTabStateCopyWith<$Res> {
  factory _$$ExerciseTodoTabStateImplCopyWith(_$ExerciseTodoTabStateImpl value,
          $Res Function(_$ExerciseTodoTabStateImpl) then) =
      __$$ExerciseTodoTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Todo exerciseTodo,
      List<Todo> exerciseTodos,
      List<bool> isSelectedList,
      List<bool> completeList});

  @override
  $TodoCopyWith<$Res> get exerciseTodo;
}

/// @nodoc
class __$$ExerciseTodoTabStateImplCopyWithImpl<$Res>
    extends _$ExerciseTodoTabStateCopyWithImpl<$Res, _$ExerciseTodoTabStateImpl>
    implements _$$ExerciseTodoTabStateImplCopyWith<$Res> {
  __$$ExerciseTodoTabStateImplCopyWithImpl(_$ExerciseTodoTabStateImpl _value,
      $Res Function(_$ExerciseTodoTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseTodo = null,
    Object? exerciseTodos = null,
    Object? isSelectedList = null,
    Object? completeList = null,
  }) {
    return _then(_$ExerciseTodoTabStateImpl(
      exerciseTodo: null == exerciseTodo
          ? _value.exerciseTodo
          : exerciseTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      exerciseTodos: null == exerciseTodos
          ? _value._exerciseTodos
          : exerciseTodos // ignore: cast_nullable_to_non_nullable
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

class _$ExerciseTodoTabStateImpl extends _ExerciseTodoTabState {
  _$ExerciseTodoTabStateImpl(
      {this.exerciseTodo = const Todo(),
      final List<Todo> exerciseTodos = const [],
      final List<bool> isSelectedList = const [],
      final List<bool> completeList = const []})
      : _exerciseTodos = exerciseTodos,
        _isSelectedList = isSelectedList,
        _completeList = completeList,
        super._();

  @override
  @JsonKey()
  final Todo exerciseTodo;
  final List<Todo> _exerciseTodos;
  @override
  @JsonKey()
  List<Todo> get exerciseTodos {
    if (_exerciseTodos is EqualUnmodifiableListView) return _exerciseTodos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseTodos);
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
    return 'ExerciseTodoTabState(exerciseTodo: $exerciseTodo, exerciseTodos: $exerciseTodos, isSelectedList: $isSelectedList, completeList: $completeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseTodoTabStateImpl &&
            (identical(other.exerciseTodo, exerciseTodo) ||
                other.exerciseTodo == exerciseTodo) &&
            const DeepCollectionEquality()
                .equals(other._exerciseTodos, _exerciseTodos) &&
            const DeepCollectionEquality()
                .equals(other._isSelectedList, _isSelectedList) &&
            const DeepCollectionEquality()
                .equals(other._completeList, _completeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      exerciseTodo,
      const DeepCollectionEquality().hash(_exerciseTodos),
      const DeepCollectionEquality().hash(_isSelectedList),
      const DeepCollectionEquality().hash(_completeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseTodoTabStateImplCopyWith<_$ExerciseTodoTabStateImpl>
      get copyWith =>
          __$$ExerciseTodoTabStateImplCopyWithImpl<_$ExerciseTodoTabStateImpl>(
              this, _$identity);
}

abstract class _ExerciseTodoTabState extends ExerciseTodoTabState {
  factory _ExerciseTodoTabState(
      {final Todo exerciseTodo,
      final List<Todo> exerciseTodos,
      final List<bool> isSelectedList,
      final List<bool> completeList}) = _$ExerciseTodoTabStateImpl;
  _ExerciseTodoTabState._() : super._();

  @override
  Todo get exerciseTodo;
  @override
  List<Todo> get exerciseTodos;
  @override
  List<bool> get isSelectedList;
  @override
  List<bool> get completeList;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseTodoTabStateImplCopyWith<_$ExerciseTodoTabStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
