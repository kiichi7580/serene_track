// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_setting_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationSettingPageState {
  bool get notificationPermissionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationSettingPageStateCopyWith<NotificationSettingPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingPageStateCopyWith<$Res> {
  factory $NotificationSettingPageStateCopyWith(
          NotificationSettingPageState value,
          $Res Function(NotificationSettingPageState) then) =
      _$NotificationSettingPageStateCopyWithImpl<$Res,
          NotificationSettingPageState>;
  @useResult
  $Res call({bool notificationPermissionStatus});
}

/// @nodoc
class _$NotificationSettingPageStateCopyWithImpl<$Res,
        $Val extends NotificationSettingPageState>
    implements $NotificationSettingPageStateCopyWith<$Res> {
  _$NotificationSettingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationPermissionStatus = null,
  }) {
    return _then(_value.copyWith(
      notificationPermissionStatus: null == notificationPermissionStatus
          ? _value.notificationPermissionStatus
          : notificationPermissionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingPageStateImplCopyWith<$Res>
    implements $NotificationSettingPageStateCopyWith<$Res> {
  factory _$$NotificationSettingPageStateImplCopyWith(
          _$NotificationSettingPageStateImpl value,
          $Res Function(_$NotificationSettingPageStateImpl) then) =
      __$$NotificationSettingPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool notificationPermissionStatus});
}

/// @nodoc
class __$$NotificationSettingPageStateImplCopyWithImpl<$Res>
    extends _$NotificationSettingPageStateCopyWithImpl<$Res,
        _$NotificationSettingPageStateImpl>
    implements _$$NotificationSettingPageStateImplCopyWith<$Res> {
  __$$NotificationSettingPageStateImplCopyWithImpl(
      _$NotificationSettingPageStateImpl _value,
      $Res Function(_$NotificationSettingPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationPermissionStatus = null,
  }) {
    return _then(_$NotificationSettingPageStateImpl(
      notificationPermissionStatus: null == notificationPermissionStatus
          ? _value.notificationPermissionStatus
          : notificationPermissionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationSettingPageStateImpl
    implements _NotificationSettingPageState {
  const _$NotificationSettingPageStateImpl(
      {this.notificationPermissionStatus = false});

  @override
  @JsonKey()
  final bool notificationPermissionStatus;

  @override
  String toString() {
    return 'NotificationSettingPageState(notificationPermissionStatus: $notificationPermissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingPageStateImpl &&
            (identical(other.notificationPermissionStatus,
                    notificationPermissionStatus) ||
                other.notificationPermissionStatus ==
                    notificationPermissionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationPermissionStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingPageStateImplCopyWith<
          _$NotificationSettingPageStateImpl>
      get copyWith => __$$NotificationSettingPageStateImplCopyWithImpl<
          _$NotificationSettingPageStateImpl>(this, _$identity);
}

abstract class _NotificationSettingPageState
    implements NotificationSettingPageState {
  const factory _NotificationSettingPageState(
          {final bool notificationPermissionStatus}) =
      _$NotificationSettingPageStateImpl;

  @override
  bool get notificationPermissionStatus;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSettingPageStateImplCopyWith<
          _$NotificationSettingPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
