// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_todo_tab_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepTodoTabState {
  Todo get sleepTodo => throw _privateConstructorUsedError;
  List<Todo> get sleepTodoList => throw _privateConstructorUsedError;
  List<bool> get isSelectedList => throw _privateConstructorUsedError;
  List<bool> get checkedList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepTodoTabStateCopyWith<SleepTodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepTodoTabStateCopyWith<$Res> {
  factory $SleepTodoTabStateCopyWith(
          SleepTodoTabState value, $Res Function(SleepTodoTabState) then) =
      _$SleepTodoTabStateCopyWithImpl<$Res, SleepTodoTabState>;
  @useResult
  $Res call(
      {Todo sleepTodo,
      List<Todo> sleepTodoList,
      List<bool> isSelectedList,
      List<bool> checkedList});

  $TodoCopyWith<$Res> get sleepTodo;
}

/// @nodoc
class _$SleepTodoTabStateCopyWithImpl<$Res, $Val extends SleepTodoTabState>
    implements $SleepTodoTabStateCopyWith<$Res> {
  _$SleepTodoTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sleepTodo = null,
    Object? sleepTodoList = null,
    Object? isSelectedList = null,
    Object? checkedList = null,
  }) {
    return _then(_value.copyWith(
      sleepTodo: null == sleepTodo
          ? _value.sleepTodo
          : sleepTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      sleepTodoList: null == sleepTodoList
          ? _value.sleepTodoList
          : sleepTodoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isSelectedList: null == isSelectedList
          ? _value.isSelectedList
          : isSelectedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      checkedList: null == checkedList
          ? _value.checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res> get sleepTodo {
    return $TodoCopyWith<$Res>(_value.sleepTodo, (value) {
      return _then(_value.copyWith(sleepTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SleepTodoTabStateImplCopyWith<$Res>
    implements $SleepTodoTabStateCopyWith<$Res> {
  factory _$$SleepTodoTabStateImplCopyWith(_$SleepTodoTabStateImpl value,
          $Res Function(_$SleepTodoTabStateImpl) then) =
      __$$SleepTodoTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Todo sleepTodo,
      List<Todo> sleepTodoList,
      List<bool> isSelectedList,
      List<bool> checkedList});

  @override
  $TodoCopyWith<$Res> get sleepTodo;
}

/// @nodoc
class __$$SleepTodoTabStateImplCopyWithImpl<$Res>
    extends _$SleepTodoTabStateCopyWithImpl<$Res, _$SleepTodoTabStateImpl>
    implements _$$SleepTodoTabStateImplCopyWith<$Res> {
  __$$SleepTodoTabStateImplCopyWithImpl(_$SleepTodoTabStateImpl _value,
      $Res Function(_$SleepTodoTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sleepTodo = null,
    Object? sleepTodoList = null,
    Object? isSelectedList = null,
    Object? checkedList = null,
  }) {
    return _then(_$SleepTodoTabStateImpl(
      sleepTodo: null == sleepTodo
          ? _value.sleepTodo
          : sleepTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      sleepTodoList: null == sleepTodoList
          ? _value._sleepTodoList
          : sleepTodoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isSelectedList: null == isSelectedList
          ? _value._isSelectedList
          : isSelectedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      checkedList: null == checkedList
          ? _value._checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$SleepTodoTabStateImpl extends _SleepTodoTabState {
  _$SleepTodoTabStateImpl(
      {this.sleepTodo = const Todo(),
      final List<Todo> sleepTodoList = const [],
      final List<bool> isSelectedList = const [],
      final List<bool> checkedList = const []})
      : _sleepTodoList = sleepTodoList,
        _isSelectedList = isSelectedList,
        _checkedList = checkedList,
        super._();

  @override
  @JsonKey()
  final Todo sleepTodo;
  final List<Todo> _sleepTodoList;
  @override
  @JsonKey()
  List<Todo> get sleepTodoList {
    if (_sleepTodoList is EqualUnmodifiableListView) return _sleepTodoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sleepTodoList);
  }

  final List<bool> _isSelectedList;
  @override
  @JsonKey()
  List<bool> get isSelectedList {
    if (_isSelectedList is EqualUnmodifiableListView) return _isSelectedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isSelectedList);
  }

  final List<bool> _checkedList;
  @override
  @JsonKey()
  List<bool> get checkedList {
    if (_checkedList is EqualUnmodifiableListView) return _checkedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkedList);
  }

  @override
  String toString() {
    return 'SleepTodoTabState(sleepTodo: $sleepTodo, sleepTodoList: $sleepTodoList, isSelectedList: $isSelectedList, checkedList: $checkedList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepTodoTabStateImpl &&
            (identical(other.sleepTodo, sleepTodo) ||
                other.sleepTodo == sleepTodo) &&
            const DeepCollectionEquality()
                .equals(other._sleepTodoList, _sleepTodoList) &&
            const DeepCollectionEquality()
                .equals(other._isSelectedList, _isSelectedList) &&
            const DeepCollectionEquality()
                .equals(other._checkedList, _checkedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sleepTodo,
      const DeepCollectionEquality().hash(_sleepTodoList),
      const DeepCollectionEquality().hash(_isSelectedList),
      const DeepCollectionEquality().hash(_checkedList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepTodoTabStateImplCopyWith<_$SleepTodoTabStateImpl> get copyWith =>
      __$$SleepTodoTabStateImplCopyWithImpl<_$SleepTodoTabStateImpl>(
          this, _$identity);
}

abstract class _SleepTodoTabState extends SleepTodoTabState {
  factory _SleepTodoTabState(
      {final Todo sleepTodo,
      final List<Todo> sleepTodoList,
      final List<bool> isSelectedList,
      final List<bool> checkedList}) = _$SleepTodoTabStateImpl;
  _SleepTodoTabState._() : super._();

  @override
  Todo get sleepTodo;
  @override
  List<Todo> get sleepTodoList;
  @override
  List<bool> get isSelectedList;
  @override
  List<bool> get checkedList;
  @override
  @JsonKey(ignore: true)
  _$$SleepTodoTabStateImplCopyWith<_$SleepTodoTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
