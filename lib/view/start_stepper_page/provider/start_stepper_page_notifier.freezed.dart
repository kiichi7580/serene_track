// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_stepper_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartStepperPageState {
  int get currentStep => throw _privateConstructorUsedError;
  List<bool> get checkedList => throw _privateConstructorUsedError;
  bool get isAllChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartStepperPageStateCopyWith<StartStepperPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStepperPageStateCopyWith<$Res> {
  factory $StartStepperPageStateCopyWith(StartStepperPageState value,
          $Res Function(StartStepperPageState) then) =
      _$StartStepperPageStateCopyWithImpl<$Res, StartStepperPageState>;
  @useResult
  $Res call({int currentStep, List<bool> checkedList, bool isAllChecked});
}

/// @nodoc
class _$StartStepperPageStateCopyWithImpl<$Res,
        $Val extends StartStepperPageState>
    implements $StartStepperPageStateCopyWith<$Res> {
  _$StartStepperPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? checkedList = null,
    Object? isAllChecked = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      checkedList: null == checkedList
          ? _value.checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isAllChecked: null == isAllChecked
          ? _value.isAllChecked
          : isAllChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartStepperPageStateImplCopyWith<$Res>
    implements $StartStepperPageStateCopyWith<$Res> {
  factory _$$StartStepperPageStateImplCopyWith(
          _$StartStepperPageStateImpl value,
          $Res Function(_$StartStepperPageStateImpl) then) =
      __$$StartStepperPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentStep, List<bool> checkedList, bool isAllChecked});
}

/// @nodoc
class __$$StartStepperPageStateImplCopyWithImpl<$Res>
    extends _$StartStepperPageStateCopyWithImpl<$Res,
        _$StartStepperPageStateImpl>
    implements _$$StartStepperPageStateImplCopyWith<$Res> {
  __$$StartStepperPageStateImplCopyWithImpl(_$StartStepperPageStateImpl _value,
      $Res Function(_$StartStepperPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? checkedList = null,
    Object? isAllChecked = null,
  }) {
    return _then(_$StartStepperPageStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      checkedList: null == checkedList
          ? _value._checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isAllChecked: null == isAllChecked
          ? _value.isAllChecked
          : isAllChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartStepperPageStateImpl extends _StartStepperPageState {
  _$StartStepperPageStateImpl(
      {this.currentStep = 0,
      final List<bool> checkedList = const [],
      this.isAllChecked = false})
      : _checkedList = checkedList,
        super._();

  @override
  @JsonKey()
  final int currentStep;
  final List<bool> _checkedList;
  @override
  @JsonKey()
  List<bool> get checkedList {
    if (_checkedList is EqualUnmodifiableListView) return _checkedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkedList);
  }

  @override
  @JsonKey()
  final bool isAllChecked;

  @override
  String toString() {
    return 'StartStepperPageState(currentStep: $currentStep, checkedList: $checkedList, isAllChecked: $isAllChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartStepperPageStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality()
                .equals(other._checkedList, _checkedList) &&
            (identical(other.isAllChecked, isAllChecked) ||
                other.isAllChecked == isAllChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep,
      const DeepCollectionEquality().hash(_checkedList), isAllChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartStepperPageStateImplCopyWith<_$StartStepperPageStateImpl>
      get copyWith => __$$StartStepperPageStateImplCopyWithImpl<
          _$StartStepperPageStateImpl>(this, _$identity);
}

abstract class _StartStepperPageState extends StartStepperPageState {
  factory _StartStepperPageState(
      {final int currentStep,
      final List<bool> checkedList,
      final bool isAllChecked}) = _$StartStepperPageStateImpl;
  _StartStepperPageState._() : super._();

  @override
  int get currentStep;
  @override
  List<bool> get checkedList;
  @override
  bool get isAllChecked;
  @override
  @JsonKey(ignore: true)
  _$$StartStepperPageStateImplCopyWith<_$StartStepperPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
