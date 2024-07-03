import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default('') String id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String photoUrl,
    @Default('') String role,
    @Default(true) bool isActive,
    @Default(null) DateTime? createdAt,
}) = _User;

factory User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);
}