import 'package:email_validator/email_validator.dart';

mixin Validator {

  static String? validateEmail(String? value) {
    if (value != null && EmailValidator.validate(value)) return null;
    return 'Email inválido';
  }

  static String? validateUser(String? value) {
    if (value != null && value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (!value!.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Usuário inválido';
    }
    return null;
  }
  
  static String? validatePassword(String? value) {
    if (value != null && value.length < 6) {
      return 'Min 6 caracteres';
    }
    return null;
  }
}