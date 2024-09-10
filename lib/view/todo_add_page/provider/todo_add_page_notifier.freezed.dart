// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_add_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoAddPageState {
  DateTime? get notificationTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoAddPageStateCopyWith<TodoAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoAddPageStateCopyWith<$Res> {
  factory $TodoAddPageStateCopyWith(
          TodoAddPageState value, $Res Function(TodoAddPageState) then) =
      _$TodoAddPageStateCopyWithImpl<$Res, TodoAddPageState>;
  @useResult
  $Res call({DateTime? notificationTime});
}

/// @nodoc
class _$TodoAddPageStateCopyWithImpl<$Res, $Val extends TodoAddPageState>
    implements $TodoAddPageStateCopyWith<$Res> {
  _$TodoAddPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$TodoAddPageStateImplCopyWith<$Res>
    implements $TodoAddPageStateCopyWith<$Res> {
  factory _$$TodoAddPageStateImplCopyWith(_$TodoAddPageStateImpl value,
          $Res Function(_$TodoAddPageStateImpl) then) =
      __$$TodoAddPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? notificationTime});
}

/// @nodoc
class __$$TodoAddPageStateImplCopyWithImpl<$Res>
    extends _$TodoAddPageStateCopyWithImpl<$Res, _$TodoAddPageStateImpl>
    implements _$$TodoAddPageStateImplCopyWith<$Res> {
  __$$TodoAddPageStateImplCopyWithImpl(_$TodoAddPageStateImpl _value,
      $Res Function(_$TodoAddPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationTime = freezed,
  }) {
    return _then(_$TodoAddPageStateImpl(
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TodoAddPageStateImpl implements _TodoAddPageState {
  const _$TodoAddPageStateImpl({this.notificationTime = null});

  @override
  @JsonKey()
  final DateTime? notificationTime;

  @override
  String toString() {
    return 'TodoAddPageState(notificationTime: $notificationTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoAddPageStateImpl &&
            (identical(other.notificationTime, notificationTime) ||
                other.notificationTime == notificationTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoAddPageStateImplCopyWith<_$TodoAddPageStateImpl> get copyWith =>
      __$$TodoAddPageStateImplCopyWithImpl<_$TodoAddPageStateImpl>(
          this, _$identity);
}

abstract class _TodoAddPageState implements TodoAddPageState {
  const factory _TodoAddPageState({final DateTime? notificationTime}) =
      _$TodoAddPageStateImpl;

  @override
  DateTime? get notificationTime;
  @override
  @JsonKey(ignore: true)
  _$$TodoAddPageStateImplCopyWith<_$TodoAddPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
