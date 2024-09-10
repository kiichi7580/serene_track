// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_edit_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoEditPageState {
  DateTime? get notificationTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoEditPageStateCopyWith<TodoEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEditPageStateCopyWith<$Res> {
  factory $TodoEditPageStateCopyWith(
          TodoEditPageState value, $Res Function(TodoEditPageState) then) =
      _$TodoEditPageStateCopyWithImpl<$Res, TodoEditPageState>;
  @useResult
  $Res call({DateTime? notificationTime});
}

/// @nodoc
class _$TodoEditPageStateCopyWithImpl<$Res, $Val extends TodoEditPageState>
    implements $TodoEditPageStateCopyWith<$Res> {
  _$TodoEditPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationTime = freezed,
  }) {
    return _then(_value.copyWith(
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoEditPageStateImplCopyWith<$Res>
    implements $TodoEditPageStateCopyWith<$Res> {
  factory _$$TodoEditPageStateImplCopyWith(_$TodoEditPageStateImpl value,
          $Res Function(_$TodoEditPageStateImpl) then) =
      __$$TodoEditPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? notificationTime});
}

/// @nodoc
class __$$TodoEditPageStateImplCopyWithImpl<$Res>
    extends _$TodoEditPageStateCopyWithImpl<$Res, _$TodoEditPageStateImpl>
    implements _$$TodoEditPageStateImplCopyWith<$Res> {
  __$$TodoEditPageStateImplCopyWithImpl(_$TodoEditPageStateImpl _value,
      $Res Function(_$TodoEditPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationTime = freezed,
  }) {
    return _then(_$TodoEditPageStateImpl(
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TodoEditPageStateImpl implements _TodoEditPageState {
  const _$TodoEditPageStateImpl({this.notificationTime = null});

  @override
  @JsonKey()
  final DateTime? notificationTime;

  @override
  String toString() {
    return 'TodoEditPageState(notificationTime: $notificationTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoEditPageStateImpl &&
            (identical(other.notificationTime, notificationTime) ||
                other.notificationTime == notificationTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoEditPageStateImplCopyWith<_$TodoEditPageStateImpl> get copyWith =>
      __$$TodoEditPageStateImplCopyWithImpl<_$TodoEditPageStateImpl>(
          this, _$identity);
}

abstract class _TodoEditPageState implements TodoEditPageState {
  const factory _TodoEditPageState({final DateTime? notificationTime}) =
      _$TodoEditPageStateImpl;

  @override
  DateTime? get notificationTime;
  @override
  @JsonKey(ignore: true)
  _$$TodoEditPageStateImplCopyWith<_$TodoEditPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
