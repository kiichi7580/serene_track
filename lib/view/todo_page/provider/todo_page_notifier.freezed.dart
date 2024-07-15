// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoPageState {
  TabController get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoPageStateCopyWith<TodoPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoPageStateCopyWith<$Res> {
  factory $TodoPageStateCopyWith(
          TodoPageState value, $Res Function(TodoPageState) then) =
      _$TodoPageStateCopyWithImpl<$Res, TodoPageState>;
  @useResult
  $Res call({TabController controller});
}

/// @nodoc
class _$TodoPageStateCopyWithImpl<$Res, $Val extends TodoPageState>
    implements $TodoPageStateCopyWith<$Res> {
  _$TodoPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_value.copyWith(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TabController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoPageStateImplCopyWith<$Res>
    implements $TodoPageStateCopyWith<$Res> {
  factory _$$TodoPageStateImplCopyWith(
          _$TodoPageStateImpl value, $Res Function(_$TodoPageStateImpl) then) =
      __$$TodoPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TabController controller});
}

/// @nodoc
class __$$TodoPageStateImplCopyWithImpl<$Res>
    extends _$TodoPageStateCopyWithImpl<$Res, _$TodoPageStateImpl>
    implements _$$TodoPageStateImplCopyWith<$Res> {
  __$$TodoPageStateImplCopyWithImpl(
      _$TodoPageStateImpl _value, $Res Function(_$TodoPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$TodoPageStateImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TabController,
    ));
  }
}

/// @nodoc

class _$TodoPageStateImpl extends _TodoPageState {
  _$TodoPageStateImpl({required this.controller}) : super._();

  @override
  final TabController controller;

  @override
  String toString() {
    return 'TodoPageState(controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoPageStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoPageStateImplCopyWith<_$TodoPageStateImpl> get copyWith =>
      __$$TodoPageStateImplCopyWithImpl<_$TodoPageStateImpl>(this, _$identity);
}

abstract class _TodoPageState extends TodoPageState {
  factory _TodoPageState({required final TabController controller}) =
      _$TodoPageStateImpl;
  _TodoPageState._() : super._();

  @override
  TabController get controller;
  @override
  @JsonKey(ignore: true)
  _$$TodoPageStateImplCopyWith<_$TodoPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
