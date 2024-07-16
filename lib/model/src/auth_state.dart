import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AuthState({
    @Default('') String accessToken,
    @Default('') String tokenType,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
