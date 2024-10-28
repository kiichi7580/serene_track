// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageState {
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageStateCopyWith<ImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageStateCopyWith<$Res> {
  factory $ImageStateCopyWith(
          ImageState value, $Res Function(ImageState) then) =
      _$ImageStateCopyWithImpl<$Res, ImageState>;
  @useResult
  $Res call({String imageUrl, bool isLoading});
}

/// @nodoc
class _$ImageStateCopyWithImpl<$Res, $Val extends ImageState>
    implements $ImageStateCopyWith<$Res> {
  _$ImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageStateImplCopyWith<$Res>
    implements $ImageStateCopyWith<$Res> {
  factory _$$ImageStateImplCopyWith(
          _$ImageStateImpl value, $Res Function(_$ImageStateImpl) then) =
      __$$ImageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, bool isLoading});
}

/// @nodoc
class __$$ImageStateImplCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageStateImpl>
    implements _$$ImageStateImplCopyWith<$Res> {
  __$$ImageStateImplCopyWithImpl(
      _$ImageStateImpl _value, $Res Function(_$ImageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? isLoading = null,
  }) {
    return _then(_$ImageStateImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ImageStateImpl extends _ImageState {
  _$ImageStateImpl({this.imageUrl = '', this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ImageState(imageUrl: $imageUrl, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageStateImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageStateImplCopyWith<_$ImageStateImpl> get copyWith =>
      __$$ImageStateImplCopyWithImpl<_$ImageStateImpl>(this, _$identity);
}

abstract class _ImageState extends ImageState {
  factory _ImageState({final String imageUrl, final bool isLoading}) =
      _$ImageStateImpl;
  _ImageState._() : super._();

  @override
  String get imageUrl;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ImageStateImplCopyWith<_$ImageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
