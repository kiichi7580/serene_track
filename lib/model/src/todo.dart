import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/enum/category.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Todo({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @CategoryEnumConverter() Category? categoryId,
    @Default(0) int ownerId,
    @Default(false) bool complete,
    @Default(null) DateTime? notificationTime,
    @Default(null) DateTime? createdAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
