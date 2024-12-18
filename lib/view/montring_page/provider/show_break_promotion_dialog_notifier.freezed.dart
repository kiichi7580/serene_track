// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_break_promotion_dialog_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShowBreakPromotionDialogState {
  List<bool> get checkedList => throw _privateConstructorUsedError;
  bool get isAllChecked => throw _privateConstructorUsedError;
  bool get response => throw _privateConstructorUsedError;
  ConfettiController? get confettiController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowBreakPromotionDialogStateCopyWith<ShowBreakPromotionDialogState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowBreakPromotionDialogStateCopyWith<$Res> {
  factory $ShowBreakPromotionDialogStateCopyWith(
          ShowBreakPromotionDialogState value,
          $Res Function(ShowBreakPromotionDialogState) then) =
      _$ShowBreakPromotionDialogStateCopyWithImpl<$Res,
          ShowBreakPromotionDialogState>;
  @useResult
  $Res call(
      {List<bool> checkedList,
      bool isAllChecked,
      bool response,
      ConfettiController? confettiController});
}

/// @nodoc
class _$ShowBreakPromotionDialogStateCopyWithImpl<$Res,
        $Val extends ShowBreakPromotionDialogState>
    implements $ShowBreakPromotionDialogStateCopyWith<$Res> {
  _$ShowBreakPromotionDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkedList = null,
    Object? isAllChecked = null,
    Object? response = null,
    Object? confettiController = freezed,
  }) {
    return _then(_value.copyWith(
      checkedList: null == checkedList
          ? _value.checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isAllChecked: null == isAllChecked
          ? _value.isAllChecked
          : isAllChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as bool,
      confettiController: freezed == confettiController
          ? _value.confettiController
          : confettiController // ignore: cast_nullable_to_non_nullable
              as ConfettiController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowBreakPromotionDialogStateImplCopyWith<$Res>
    implements $ShowBreakPromotionDialogStateCopyWith<$Res> {
  factory _$$ShowBreakPromotionDialogStateImplCopyWith(
          _$ShowBreakPromotionDialogStateImpl value,
          $Res Function(_$ShowBreakPromotionDialogStateImpl) then) =
      __$$ShowBreakPromotionDialogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<bool> checkedList,
      bool isAllChecked,
      bool response,
      ConfettiController? confettiController});
}

/// @nodoc
class __$$ShowBreakPromotionDialogStateImplCopyWithImpl<$Res>
    extends _$ShowBreakPromotionDialogStateCopyWithImpl<$Res,
        _$ShowBreakPromotionDialogStateImpl>
    implements _$$ShowBreakPromotionDialogStateImplCopyWith<$Res> {
  __$$ShowBreakPromotionDialogStateImplCopyWithImpl(
      _$ShowBreakPromotionDialogStateImpl _value,
      $Res Function(_$ShowBreakPromotionDialogStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkedList = null,
    Object? isAllChecked = null,
    Object? response = null,
    Object? confettiController = freezed,
  }) {
    return _then(_$ShowBreakPromotionDialogStateImpl(
      checkedList: null == checkedList
          ? _value._checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isAllChecked: null == isAllChecked
          ? _value.isAllChecked
          : isAllChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as bool,
      confettiController: freezed == confettiController
          ? _value.confettiController
          : confettiController // ignore: cast_nullable_to_non_nullable
              as ConfettiController?,
    ));
  }
}

/// @nodoc

class _$ShowBreakPromotionDialogStateImpl
    extends _ShowBreakPromotionDialogState {
  _$ShowBreakPromotionDialogStateImpl(
      {final List<bool> checkedList = const [],
      this.isAllChecked = false,
      this.response = false,
      this.confettiController})
      : _checkedList = checkedList,
        super._();

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
  @JsonKey()
  final bool response;
  @override
  final ConfettiController? confettiController;

  @override
  String toString() {
    return 'ShowBreakPromotionDialogState(checkedList: $checkedList, isAllChecked: $isAllChecked, response: $response, confettiController: $confettiController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowBreakPromotionDialogStateImpl &&
            const DeepCollectionEquality()
                .equals(other._checkedList, _checkedList) &&
            (identical(other.isAllChecked, isAllChecked) ||
                other.isAllChecked == isAllChecked) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.confettiController, confettiController) ||
                other.confettiController == confettiController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_checkedList),
      isAllChecked,
      response,
      confettiController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowBreakPromotionDialogStateImplCopyWith<
          _$ShowBreakPromotionDialogStateImpl>
      get copyWith => __$$ShowBreakPromotionDialogStateImplCopyWithImpl<
          _$ShowBreakPromotionDialogStateImpl>(this, _$identity);
}

abstract class _ShowBreakPromotionDialogState
    extends ShowBreakPromotionDialogState {
  factory _ShowBreakPromotionDialogState(
          {final List<bool> checkedList,
          final bool isAllChecked,
          final bool response,
          final ConfettiController? confettiController}) =
      _$ShowBreakPromotionDialogStateImpl;
  _ShowBreakPromotionDialogState._() : super._();

  @override
  List<bool> get checkedList;
  @override
  bool get isAllChecked;
  @override
  bool get response;
  @override
  ConfettiController? get confettiController;
  @override
  @JsonKey(ignore: true)
  _$$ShowBreakPromotionDialogStateImplCopyWith<
          _$ShowBreakPromotionDialogStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
