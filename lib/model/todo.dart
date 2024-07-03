import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String categoryId,
    @Default('') String uid,
    @Default(false) bool completed,
    @Default(null) DateTime? createdAt,
}) = _Todo;

factory Todo.fromJson(Map<String, dynamic> json) =>_$TodoFromJson(json);
}