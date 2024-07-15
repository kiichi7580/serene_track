// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_todo_tab_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllTodoTabState {
  Todo get allTodo => throw _privateConstructorUsedError;
  List<Todo> get allTodoList => throw _privateConstructorUsedError;
  List<bool> get isSelectedList => throw _privateConstructorUsedError;
  List<bool> get checkedList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllTodoTabStateCopyWith<AllTodoTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTodoTabStateCopyWith<$Res> {
  factory $AllTodoTabStateCopyWith(
          AllTodoTabState value, $Res Function(AllTodoTabState) then) =
      _$AllTodoTabStateCopyWithImpl<$Res, AllTodoTabState>;
  @useResult
  $Res call(
      {Todo allTodo,
      List<Todo> allTodoList,
      List<bool> isSelectedList,
      List<bool> checkedList});

  $TodoCopyWith<$Res> get allTodo;
}

/// @nodoc
class _$AllTodoTabStateCopyWithImpl<$Res, $Val extends AllTodoTabState>
    implements $AllTodoTabStateCopyWith<$Res> {
  _$AllTodoTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTodo = null,
    Object? allTodoList = null,
    Object? isSelectedList = null,
    Object? checkedList = null,
  }) {
    return _then(_value.copyWith(
      allTodo: null == allTodo
          ? _value.allTodo
          : allTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      allTodoList: null == allTodoList
          ? _value.allTodoList
          : allTodoList // ignore: cast_nullable_to_non_nullable
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
  $TodoCopyWith<$Res> get allTodo {
    return $TodoCopyWith<$Res>(_value.allTodo, (value) {
      return _then(_value.copyWith(allTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllTodoTabStateImplCopyWith<$Res>
    implements $AllTodoTabStateCopyWith<$Res> {
  factory _$$AllTodoTabStateImplCopyWith(_$AllTodoTabStateImpl value,
          $Res Function(_$AllTodoTabStateImpl) then) =
      __$$AllTodoTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Todo allTodo,
      List<Todo> allTodoList,
      List<bool> isSelectedList,
      List<bool> checkedList});

  @override
  $TodoCopyWith<$Res> get allTodo;
}

/// @nodoc
class __$$AllTodoTabStateImplCopyWithImpl<$Res>
    extends _$AllTodoTabStateCopyWithImpl<$Res, _$AllTodoTabStateImpl>
    implements _$$AllTodoTabStateImplCopyWith<$Res> {
  __$$AllTodoTabStateImplCopyWithImpl(
      _$AllTodoTabStateImpl _value, $Res Function(_$AllTodoTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTodo = null,
    Object? allTodoList = null,
    Object? isSelectedList = null,
    Object? checkedList = null,
  }) {
    return _then(_$AllTodoTabStateImpl(
      allTodo: null == allTodo
          ? _value.allTodo
          : allTodo // ignore: cast_nullable_to_non_nullable
              as Todo,
      allTodoList: null == allTodoList
          ? _value._allTodoList
          : allTodoList // ignore: cast_nullable_to_non_nullable
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

class _$AllTodoTabStateImpl extends _AllTodoTabState {
  _$AllTodoTabStateImpl(
      {this.allTodo = const Todo(),
      final List<Todo> allTodoList = const [],
      final List<bool> isSelectedList = const [],
      final List<bool> checkedList = const []})
      : _allTodoList = allTodoList,
        _isSelectedList = isSelectedList,
        _checkedList = checkedList,
        super._();

  @override
  @JsonKey()
  final Todo allTodo;
  final List<Todo> _allTodoList;
  @override
  @JsonKey()
  List<Todo> get allTodoList {
    if (_allTodoList is EqualUnmodifiableListView) return _allTodoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTodoList);
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
    return 'AllTodoTabState(allTodo: $allTodo, allTodoList: $allTodoList, isSelectedList: $isSelectedList, checkedList: $checkedList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllTodoTabStateImpl &&
            (identical(other.allTodo, allTodo) || other.allTodo == allTodo) &&
            const DeepCollectionEquality()
                .equals(other._allTodoList, _allTodoList) &&
            const DeepCollectionEquality()
                .equals(other._isSelectedList, _isSelectedList) &&
            const DeepCollectionEquality()
                .equals(other._checkedList, _checkedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      allTodo,
      const DeepCollectionEquality().hash(_allTodoList),
      const DeepCollectionEquality().hash(_isSelectedList),
      const DeepCollectionEquality().hash(_checkedList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllTodoTabStateImplCopyWith<_$AllTodoTabStateImpl> get copyWith =>
      __$$AllTodoTabStateImplCopyWithImpl<_$AllTodoTabStateImpl>(
          this, _$identity);
}

abstract class _AllTodoTabState extends AllTodoTabState {
  factory _AllTodoTabState(
      {final Todo allTodo,
      final List<Todo> allTodoList,
      final List<bool> isSelectedList,
      final List<bool> checkedList}) = _$AllTodoTabStateImpl;
  _AllTodoTabState._() : super._();

  @override
  Todo get allTodo;
  @override
  List<Todo> get allTodoList;
  @override
  List<bool> get isSelectedList;
  @override
  List<bool> get checkedList;
  @override
  @JsonKey(ignore: true)
  _$$AllTodoTabStateImplCopyWith<_$AllTodoTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
