// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashPageState {
  bool get isLogin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashPageStateCopyWith<SplashPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashPageStateCopyWith<$Res> {
  factory $SplashPageStateCopyWith(
          SplashPageState value, $Res Function(SplashPageState) then) =
      _$SplashPageStateCopyWithImpl<$Res, SplashPageState>;
  @useResult
  $Res call({bool isLogin});
}

/// @nodoc
class _$SplashPageStateCopyWithImpl<$Res, $Val extends SplashPageState>
    implements $SplashPageStateCopyWith<$Res> {
  _$SplashPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
  }) {
    return _then(_value.copyWith(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashPageStateImplCopyWith<$Res>
    implements $SplashPageStateCopyWith<$Res> {
  factory _$$SplashPageStateImplCopyWith(_$SplashPageStateImpl value,
          $Res Function(_$SplashPageStateImpl) then) =
      __$$SplashPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLogin});
}

/// @nodoc
class __$$SplashPageStateImplCopyWithImpl<$Res>
    extends _$SplashPageStateCopyWithImpl<$Res, _$SplashPageStateImpl>
    implements _$$SplashPageStateImplCopyWith<$Res> {
  __$$SplashPageStateImplCopyWithImpl(
      _$SplashPageStateImpl _value, $Res Function(_$SplashPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
  }) {
    return _then(_$SplashPageStateImpl(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SplashPageStateImpl implements _SplashPageState {
  const _$SplashPageStateImpl({this.isLogin = false});

  @override
  @JsonKey()
  final bool isLogin;

  @override
  String toString() {
    return 'SplashPageState(isLogin: $isLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashPageStateImpl &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashPageStateImplCopyWith<_$SplashPageStateImpl> get copyWith =>
      __$$SplashPageStateImplCopyWithImpl<_$SplashPageStateImpl>(
          this, _$identity);
}

abstract class _SplashPageState implements SplashPageState {
  const factory _SplashPageState({final bool isLogin}) = _$SplashPageStateImpl;

  @override
  bool get isLogin;
  @override
  @JsonKey(ignore: true)
  _$$SplashPageStateImplCopyWith<_$SplashPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
