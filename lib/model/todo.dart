import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @JsonKey(name: 'category_id') @Default('') String categoryId,
    @JsonKey(name: 'owner_id') @Default(0) int uid,
    @Default(false) bool completed,
    @JsonKey(name: 'notification_time') @Default(null) DateTime? notificationTime,
    @JsonKey(name: 'created_at') @Default(null) DateTime? createdAt,
}) = _Todo;

factory Todo.fromJson(Map<String, dynamic> json) =>_$TodoFromJson(json);
}