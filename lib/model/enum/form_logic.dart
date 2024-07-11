import 'package:serene_track/model/enum/auth_error_message.dart';

class FormLogic {
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailErrorMessage.emptyOrNull.errorMsg;
    }
    // 正規表現を使って、@や.を含むかどうかをチェック
    const emailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";

    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return EmailErrorMessage.invalidEmail.errorMsg;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordErrorMessage.emptyOrNull.errorMsg;
    }
    const passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$';
    // 正規表現を使って、英語の大文字、小文字、数字を含む8文字以上かどうかをチェック
    final regex = RegExp(passwordPattern);
    if (!regex.hasMatch(value)) {
      return PasswordErrorMessage.weakPassword.errorMsg;
    }
    return null;
  }

  String? confirmationPasswordValidator(
    String? value, {
    required String? passwordText,
  }) {
    if (value == null || value.isEmpty) {
      return ConfirmationPasswordErrorMessage.emptyOrNull.errorMsg;
    }
    if (value != passwordText) {
      return ConfirmationPasswordErrorMessage.correctPassword.errorMsg;
    }
    return null;
  }
}
