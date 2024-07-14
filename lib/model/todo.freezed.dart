// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  int get uid => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_time')
  DateTime? get notificationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res, Todo>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'owner_id') int uid,
      bool completed,
      @JsonKey(name: 'notification_time') DateTime? notificationTime,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res, $Val extends Todo>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? categoryId = null,
    Object? uid = null,
    Object? completed = null,
    Object? notificationTime = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoImplCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$TodoImplCopyWith(
          _$TodoImpl value, $Res Function(_$TodoImpl) then) =
      __$$TodoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'owner_id') int uid,
      bool completed,
      @JsonKey(name: 'notification_time') DateTime? notificationTime,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$TodoImplCopyWithImpl<$Res>
    extends _$TodoCopyWithImpl<$Res, _$TodoImpl>
    implements _$$TodoImplCopyWith<$Res> {
  __$$TodoImplCopyWithImpl(_$TodoImpl _value, $Res Function(_$TodoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? categoryId = null,
    Object? uid = null,
    Object? completed = null,
    Object? notificationTime = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$TodoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoImpl implements _Todo {
  const _$TodoImpl(
      {this.id = 0,
      this.title = '',
      this.description = '',
      @JsonKey(name: 'category_id') this.categoryId = '',
      @JsonKey(name: 'owner_id') this.uid = 0,
      this.completed = false,
      @JsonKey(name: 'notification_time') this.notificationTime = null,
      @JsonKey(name: 'created_at') this.createdAt = null});

  factory _$TodoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'owner_id')
  final int uid;
  @override
  @JsonKey()
  final bool completed;
  @override
  @JsonKey(name: 'notification_time')
  final DateTime? notificationTime;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, description: $description, categoryId: $categoryId, uid: $uid, completed: $completed, notificationTime: $notificationTime, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.notificationTime, notificationTime) ||
                other.notificationTime == notificationTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      categoryId, uid, completed, notificationTime, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoImplCopyWith<_$TodoImpl> get copyWith =>
      __$$TodoImplCopyWithImpl<_$TodoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoImplToJson(
      this,
    );
  }
}

abstract class _Todo implements Todo {
  const factory _Todo(
      {final int id,
      final String title,
      final String description,
      @JsonKey(name: 'category_id') final String categoryId,
      @JsonKey(name: 'owner_id') final int uid,
      final bool completed,
      @JsonKey(name: 'notification_time') final DateTime? notificationTime,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$TodoImpl;

  factory _Todo.fromJson(Map<String, dynamic> json) = _$TodoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'owner_id')
  int get uid;
  @override
  bool get completed;
  @override
  @JsonKey(name: 'notification_time')
  DateTime? get notificationTime;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TodoImplCopyWith<_$TodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
