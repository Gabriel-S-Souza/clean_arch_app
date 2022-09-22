// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  Computed<bool>? _$isValidFormComputed;

  @override
  bool get isValidForm =>
      (_$isValidFormComputed ??= Computed<bool>(() => super.isValidForm,
              name: 'LoginControllerBase.isValidForm'))
          .value;

  late final _$userAtom =
      Atom(name: 'LoginControllerBase.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$showPasswordAtom =
      Atom(name: 'LoginControllerBase.showPassword', context: context);

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'LoginControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void setUser(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePassword() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.togglePassword');
    try {
      return super.togglePassword();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
showPassword: ${showPassword},
isLoading: ${isLoading},
isValidForm: ${isValidForm}
    ''';
  }
}
