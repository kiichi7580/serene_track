import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory User({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String hashedPassword,
    @Default('') String photoUrl,
    @Default('') String shortTermGoal,
    @Default('') String longTermGoal,
    @Default('') String role,
    @Default(true) bool isActive,
    DateTime? createdAt,
}) = _User;

factory User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);
}