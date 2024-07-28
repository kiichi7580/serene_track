// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steps_tab_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StepsTabState {
  int get todaySteps => throw _privateConstructorUsedError;
  int get weekAvgSteps => throw _privateConstructorUsedError;
  List<int> get weekSteps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepsTabStateCopyWith<StepsTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepsTabStateCopyWith<$Res> {
  factory $StepsTabStateCopyWith(
          StepsTabState value, $Res Function(StepsTabState) then) =
      _$StepsTabStateCopyWithImpl<$Res, StepsTabState>;
  @useResult
  $Res call({int todaySteps, int weekAvgSteps, List<int> weekSteps});
}

/// @nodoc
class _$StepsTabStateCopyWithImpl<$Res, $Val extends StepsTabState>
    implements $StepsTabStateCopyWith<$Res> {
  _$StepsTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySteps = null,
    Object? weekAvgSteps = null,
    Object? weekSteps = null,
  }) {
    return _then(_value.copyWith(
      todaySteps: null == todaySteps
          ? _value.todaySteps
          : todaySteps // ignore: cast_nullable_to_non_nullable
              as int,
      weekAvgSteps: null == weekAvgSteps
          ? _value.weekAvgSteps
          : weekAvgSteps // ignore: cast_nullable_to_non_nullable
              as int,
      weekSteps: null == weekSteps
          ? _value.weekSteps
          : weekSteps // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepsTabStateImplCopyWith<$Res>
    implements $StepsTabStateCopyWith<$Res> {
  factory _$$StepsTabStateImplCopyWith(
          _$StepsTabStateImpl value, $Res Function(_$StepsTabStateImpl) then) =
      __$$StepsTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int todaySteps, int weekAvgSteps, List<int> weekSteps});
}

/// @nodoc
class __$$StepsTabStateImplCopyWithImpl<$Res>
    extends _$StepsTabStateCopyWithImpl<$Res, _$StepsTabStateImpl>
    implements _$$StepsTabStateImplCopyWith<$Res> {
  __$$StepsTabStateImplCopyWithImpl(
      _$StepsTabStateImpl _value, $Res Function(_$StepsTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySteps = null,
    Object? weekAvgSteps = null,
    Object? weekSteps = null,
  }) {
    return _then(_$StepsTabStateImpl(
      todaySteps: null == todaySteps
          ? _value.todaySteps
          : todaySteps // ignore: cast_nullable_to_non_nullable
              as int,
      weekAvgSteps: null == weekAvgSteps
          ? _value.weekAvgSteps
          : weekAvgSteps // ignore: cast_nullable_to_non_nullable
              as int,
      weekSteps: null == weekSteps
          ? _value._weekSteps
          : weekSteps // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$StepsTabStateImpl extends _StepsTabState {
  _$StepsTabStateImpl(
      {this.todaySteps = 0,
      this.weekAvgSteps = 0,
      final List<int> weekSteps = const []})
      : _weekSteps = weekSteps,
        super._();

  @override
  @JsonKey()
  final int todaySteps;
  @override
  @JsonKey()
  final int weekAvgSteps;
  final List<int> _weekSteps;
  @override
  @JsonKey()
  List<int> get weekSteps {
    if (_weekSteps is EqualUnmodifiableListView) return _weekSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekSteps);
  }

  @override
  String toString() {
    return 'StepsTabState(todaySteps: $todaySteps, weekAvgSteps: $weekAvgSteps, weekSteps: $weekSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepsTabStateImpl &&
            (identical(other.todaySteps, todaySteps) ||
                other.todaySteps == todaySteps) &&
            (identical(other.weekAvgSteps, weekAvgSteps) ||
                other.weekAvgSteps == weekAvgSteps) &&
            const DeepCollectionEquality()
                .equals(other._weekSteps, _weekSteps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todaySteps, weekAvgSteps,
      const DeepCollectionEquality().hash(_weekSteps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepsTabStateImplCopyWith<_$StepsTabStateImpl> get copyWith =>
      __$$StepsTabStateImplCopyWithImpl<_$StepsTabStateImpl>(this, _$identity);
}

abstract class _StepsTabState extends StepsTabState {
  factory _StepsTabState(
      {final int todaySteps,
      final int weekAvgSteps,
      final List<int> weekSteps}) = _$StepsTabStateImpl;
  _StepsTabState._() : super._();

  @override
  int get todaySteps;
  @override
  int get weekAvgSteps;
  @override
  List<int> get weekSteps;
  @override
  @JsonKey(ignore: true)
  _$$StepsTabStateImplCopyWith<_$StepsTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
