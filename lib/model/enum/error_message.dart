import 'package:serene_track/constant/text_source.dart';

enum EmailErrorMessage {
  emptyOrNull(emptyOrNullEmailMessage),
  invalidEmail(invalidEmailMessage),
  emailAlreadyInUse(emailAlreadyInUseMessage),
  ;

  const EmailErrorMessage(this.errorMsg);
  final String errorMsg;
}

enum PasswordErrorMessage {
  emptyOrNull(emptyOrNullPasswordMessage),
  weakPassword(weakPasswordMessage),
  ;

  const PasswordErrorMessage(this.errorMsg);
  final String errorMsg;
}

enum ConfirmationPasswordErrorMessage {
  emptyOrNull(emptyOrNullConfirmationPasswordMessage),
  correctPassword(correctPasswordMessage),
  ;

  const ConfirmationPasswordErrorMessage(this.errorMsg);
  final String errorMsg;
}

enum BasicErrorMessage {
  emptyOrNull(validationRes),
  ;

  const BasicErrorMessage(this.errorMsg);
  final String errorMsg;
}