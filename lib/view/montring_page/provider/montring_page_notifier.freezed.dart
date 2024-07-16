// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'montring_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MontringPageState {
  int get totalSeconds => throw _privateConstructorUsedError;
  int get dynamicSeconds => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;
  audioplayers.AudioPlayer get audioPlayer =>
      throw _privateConstructorUsedError;
  audioplayers.AssetSource? get audioPlayerSource =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MontringPageStateCopyWith<MontringPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MontringPageStateCopyWith<$Res> {
  factory $MontringPageStateCopyWith(
          MontringPageState value, $Res Function(MontringPageState) then) =
      _$MontringPageStateCopyWithImpl<$Res, MontringPageState>;
  @useResult
  $Res call(
      {int totalSeconds,
      int dynamicSeconds,
      bool isRunning,
      Timer? timer,
      audioplayers.AudioPlayer audioPlayer,
      audioplayers.AssetSource? audioPlayerSource});
}

/// @nodoc
class _$MontringPageStateCopyWithImpl<$Res, $Val extends MontringPageState>
    implements $MontringPageStateCopyWith<$Res> {
  _$MontringPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSeconds = null,
    Object? dynamicSeconds = null,
    Object? isRunning = null,
    Object? timer = freezed,
    Object? audioPlayer = null,
    Object? audioPlayerSource = freezed,
  }) {
    return _then(_value.copyWith(
      totalSeconds: null == totalSeconds
          ? _value.totalSeconds
          : totalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      dynamicSeconds: null == dynamicSeconds
          ? _value.dynamicSeconds
          : dynamicSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      audioPlayer: null == audioPlayer
          ? _value.audioPlayer
          : audioPlayer // ignore: cast_nullable_to_non_nullable
              as audioplayers.AudioPlayer,
      audioPlayerSource: freezed == audioPlayerSource
          ? _value.audioPlayerSource
          : audioPlayerSource // ignore: cast_nullable_to_non_nullable
              as audioplayers.AssetSource?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MontringPageStateImplCopyWith<$Res>
    implements $MontringPageStateCopyWith<$Res> {
  factory _$$MontringPageStateImplCopyWith(_$MontringPageStateImpl value,
          $Res Function(_$MontringPageStateImpl) then) =
      __$$MontringPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalSeconds,
      int dynamicSeconds,
      bool isRunning,
      Timer? timer,
      audioplayers.AudioPlayer audioPlayer,
      audioplayers.AssetSource? audioPlayerSource});
}

/// @nodoc
class __$$MontringPageStateImplCopyWithImpl<$Res>
    extends _$MontringPageStateCopyWithImpl<$Res, _$MontringPageStateImpl>
    implements _$$MontringPageStateImplCopyWith<$Res> {
  __$$MontringPageStateImplCopyWithImpl(_$MontringPageStateImpl _value,
      $Res Function(_$MontringPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSeconds = null,
    Object? dynamicSeconds = null,
    Object? isRunning = null,
    Object? timer = freezed,
    Object? audioPlayer = null,
    Object? audioPlayerSource = freezed,
  }) {
    return _then(_$MontringPageStateImpl(
      totalSeconds: null == totalSeconds
          ? _value.totalSeconds
          : totalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      dynamicSeconds: null == dynamicSeconds
          ? _value.dynamicSeconds
          : dynamicSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      audioPlayer: null == audioPlayer
          ? _value.audioPlayer
          : audioPlayer // ignore: cast_nullable_to_non_nullable
              as audioplayers.AudioPlayer,
      audioPlayerSource: freezed == audioPlayerSource
          ? _value.audioPlayerSource
          : audioPlayerSource // ignore: cast_nullable_to_non_nullable
              as audioplayers.AssetSource?,
    ));
  }
}

/// @nodoc

class _$MontringPageStateImpl extends _MontringPageState {
  _$MontringPageStateImpl(
      {this.totalSeconds = 0,
      this.dynamicSeconds = 0,
      this.isRunning = false,
      this.timer,
      required this.audioPlayer,
      this.audioPlayerSource = null})
      : super._();

  @override
  @JsonKey()
  final int totalSeconds;
  @override
  @JsonKey()
  final int dynamicSeconds;
  @override
  @JsonKey()
  final bool isRunning;
  @override
  final Timer? timer;
  @override
  final audioplayers.AudioPlayer audioPlayer;
  @override
  @JsonKey()
  final audioplayers.AssetSource? audioPlayerSource;

  @override
  String toString() {
    return 'MontringPageState(totalSeconds: $totalSeconds, dynamicSeconds: $dynamicSeconds, isRunning: $isRunning, timer: $timer, audioPlayer: $audioPlayer, audioPlayerSource: $audioPlayerSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MontringPageStateImpl &&
            (identical(other.totalSeconds, totalSeconds) ||
                other.totalSeconds == totalSeconds) &&
            (identical(other.dynamicSeconds, dynamicSeconds) ||
                other.dynamicSeconds == dynamicSeconds) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.audioPlayer, audioPlayer) ||
                other.audioPlayer == audioPlayer) &&
            (identical(other.audioPlayerSource, audioPlayerSource) ||
                other.audioPlayerSource == audioPlayerSource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalSeconds, dynamicSeconds,
      isRunning, timer, audioPlayer, audioPlayerSource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MontringPageStateImplCopyWith<_$MontringPageStateImpl> get copyWith =>
      __$$MontringPageStateImplCopyWithImpl<_$MontringPageStateImpl>(
          this, _$identity);
}

abstract class _MontringPageState extends MontringPageState {
  factory _MontringPageState(
          {final int totalSeconds,
          final int dynamicSeconds,
          final bool isRunning,
          final Timer? timer,
          required final audioplayers.AudioPlayer audioPlayer,
          final audioplayers.AssetSource? audioPlayerSource}) =
      _$MontringPageStateImpl;
  _MontringPageState._() : super._();

  @override
  int get totalSeconds;
  @override
  int get dynamicSeconds;
  @override
  bool get isRunning;
  @override
  Timer? get timer;
  @override
  audioplayers.AudioPlayer get audioPlayer;
  @override
  audioplayers.AssetSource? get audioPlayerSource;
  @override
  @JsonKey(ignore: true)
  _$$MontringPageStateImplCopyWith<_$MontringPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
