import 'package:email_validator/email_validator.dart';

mixin Validator {

  static String? email(String value) {
    if (EmailValidator.validate(value)) return null;
    return 'Email inválido';
  }

  static String? password(String value) {
    if (value.length < 8) {
      return 'Min 8 caracteres';
    }
    return null;
  }
}