import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Todo({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String categoryId,
    @Default(0) int ownerId,
    @Default(false) bool completed,
    @Default(null) DateTime? notificationTime,
    @Default(null) DateTime? createdAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
