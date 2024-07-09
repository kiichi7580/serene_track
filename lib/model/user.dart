import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @JsonKey(name: 'hashed_password') @Default('') String hashedPassword,
    @JsonKey(name: 'photo_url') @Default('') String photoUrl,
    @Default('') String role,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
}) = _User;

factory User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);
}