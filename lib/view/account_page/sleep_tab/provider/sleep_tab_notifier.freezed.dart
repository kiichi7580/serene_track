// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_tab_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepTabState {
  int get weekAvgTotalSleepMinutes => throw _privateConstructorUsedError;
  List<int> get weekTotalSleepMinutes => throw _privateConstructorUsedError;
  List<int> get weekAvgSleepHours => throw _privateConstructorUsedError;
  List<List<int>> get weekSleepHours => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepTabStateCopyWith<SleepTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepTabStateCopyWith<$Res> {
  factory $SleepTabStateCopyWith(
          SleepTabState value, $Res Function(SleepTabState) then) =
      _$SleepTabStateCopyWithImpl<$Res, SleepTabState>;
  @useResult
  $Res call(
      {int weekAvgTotalSleepMinutes,
      List<int> weekTotalSleepMinutes,
      List<int> weekAvgSleepHours,
      List<List<int>> weekSleepHours});
}

/// @nodoc
class _$SleepTabStateCopyWithImpl<$Res, $Val extends SleepTabState>
    implements $SleepTabStateCopyWith<$Res> {
  _$SleepTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekAvgTotalSleepMinutes = null,
    Object? weekTotalSleepMinutes = null,
    Object? weekAvgSleepHours = null,
    Object? weekSleepHours = null,
  }) {
    return _then(_value.copyWith(
      weekAvgTotalSleepMinutes: null == weekAvgTotalSleepMinutes
          ? _value.weekAvgTotalSleepMinutes
          : weekAvgTotalSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      weekTotalSleepMinutes: null == weekTotalSleepMinutes
          ? _value.weekTotalSleepMinutes
          : weekTotalSleepMinutes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weekAvgSleepHours: null == weekAvgSleepHours
          ? _value.weekAvgSleepHours
          : weekAvgSleepHours // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weekSleepHours: null == weekSleepHours
          ? _value.weekSleepHours
          : weekSleepHours // ignore: cast_nullable_to_non_nullable
              as List<List<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepTabStateImplCopyWith<$Res>
    implements $SleepTabStateCopyWith<$Res> {
  factory _$$SleepTabStateImplCopyWith(
          _$SleepTabStateImpl value, $Res Function(_$SleepTabStateImpl) then) =
      __$$SleepTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int weekAvgTotalSleepMinutes,
      List<int> weekTotalSleepMinutes,
      List<int> weekAvgSleepHours,
      List<List<int>> weekSleepHours});
}

/// @nodoc
class __$$SleepTabStateImplCopyWithImpl<$Res>
    extends _$SleepTabStateCopyWithImpl<$Res, _$SleepTabStateImpl>
    implements _$$SleepTabStateImplCopyWith<$Res> {
  __$$SleepTabStateImplCopyWithImpl(
      _$SleepTabStateImpl _value, $Res Function(_$SleepTabStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekAvgTotalSleepMinutes = null,
    Object? weekTotalSleepMinutes = null,
    Object? weekAvgSleepHours = null,
    Object? weekSleepHours = null,
  }) {
    return _then(_$SleepTabStateImpl(
      weekAvgTotalSleepMinutes: null == weekAvgTotalSleepMinutes
          ? _value.weekAvgTotalSleepMinutes
          : weekAvgTotalSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      weekTotalSleepMinutes: null == weekTotalSleepMinutes
          ? _value._weekTotalSleepMinutes
          : weekTotalSleepMinutes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weekAvgSleepHours: null == weekAvgSleepHours
          ? _value._weekAvgSleepHours
          : weekAvgSleepHours // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weekSleepHours: null == weekSleepHours
          ? _value._weekSleepHours
          : weekSleepHours // ignore: cast_nullable_to_non_nullable
              as List<List<int>>,
    ));
  }
}

/// @nodoc

class _$SleepTabStateImpl extends _SleepTabState {
  _$SleepTabStateImpl(
      {this.weekAvgTotalSleepMinutes = 0,
      final List<int> weekTotalSleepMinutes = const [],
      final List<int> weekAvgSleepHours = const [],
      final List<List<int>> weekSleepHours = const []})
      : _weekTotalSleepMinutes = weekTotalSleepMinutes,
        _weekAvgSleepHours = weekAvgSleepHours,
        _weekSleepHours = weekSleepHours,
        super._();

  @override
  @JsonKey()
  final int weekAvgTotalSleepMinutes;
  final List<int> _weekTotalSleepMinutes;
  @override
  @JsonKey()
  List<int> get weekTotalSleepMinutes {
    if (_weekTotalSleepMinutes is EqualUnmodifiableListView)
      return _weekTotalSleepMinutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekTotalSleepMinutes);
  }

  final List<int> _weekAvgSleepHours;
  @override
  @JsonKey()
  List<int> get weekAvgSleepHours {
    if (_weekAvgSleepHours is EqualUnmodifiableListView)
      return _weekAvgSleepHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekAvgSleepHours);
  }

  final List<List<int>> _weekSleepHours;
  @override
  @JsonKey()
  List<List<int>> get weekSleepHours {
    if (_weekSleepHours is EqualUnmodifiableListView) return _weekSleepHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekSleepHours);
  }

  @override
  String toString() {
    return 'SleepTabState(weekAvgTotalSleepMinutes: $weekAvgTotalSleepMinutes, weekTotalSleepMinutes: $weekTotalSleepMinutes, weekAvgSleepHours: $weekAvgSleepHours, weekSleepHours: $weekSleepHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepTabStateImpl &&
            (identical(
                    other.weekAvgTotalSleepMinutes, weekAvgTotalSleepMinutes) ||
                other.weekAvgTotalSleepMinutes == weekAvgTotalSleepMinutes) &&
            const DeepCollectionEquality()
                .equals(other._weekTotalSleepMinutes, _weekTotalSleepMinutes) &&
            const DeepCollectionEquality()
                .equals(other._weekAvgSleepHours, _weekAvgSleepHours) &&
            const DeepCollectionEquality()
                .equals(other._weekSleepHours, _weekSleepHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      weekAvgTotalSleepMinutes,
      const DeepCollectionEquality().hash(_weekTotalSleepMinutes),
      const DeepCollectionEquality().hash(_weekAvgSleepHours),
      const DeepCollectionEquality().hash(_weekSleepHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepTabStateImplCopyWith<_$SleepTabStateImpl> get copyWith =>
      __$$SleepTabStateImplCopyWithImpl<_$SleepTabStateImpl>(this, _$identity);
}

abstract class _SleepTabState extends SleepTabState {
  factory _SleepTabState(
      {final int weekAvgTotalSleepMinutes,
      final List<int> weekTotalSleepMinutes,
      final List<int> weekAvgSleepHours,
      final List<List<int>> weekSleepHours}) = _$SleepTabStateImpl;
  _SleepTabState._() : super._();

  @override
  int get weekAvgTotalSleepMinutes;
  @override
  List<int> get weekTotalSleepMinutes;
  @override
  List<int> get weekAvgSleepHours;
  @override
  List<List<int>> get weekSleepHours;
  @override
  @JsonKey(ignore: true)
  _$$SleepTabStateImplCopyWith<_$SleepTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
