// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase 
    with _$LoginController;

abstract class LoginControllerBase with Store, Validator {
  final LoginUseCase _loginUseCase;
  LoginControllerBase({required LoginUseCase loginUseCase}) : _loginUseCase = loginUseCase;

  @observable
  String user = '';

  @action
  void setUser(String value) => user = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool showPassword = false;

  @action
  void togglePassword() => showPassword = !showPassword;

  Future<void> login(BuildContext context) async {
    final loginModel = LoginModel(user: user, password: password);
    final response = await _loginUseCase.login(loginModel);

    if (response is UserEntity) {
      _goToUserScreen(context, response as UserEntity);
    } else {
      _showSnackbar(context, (response as ExceptionApp).message!);
    }
  }

  void _goToUserScreen(BuildContext context, UserEntity userEntity) {
    // Navigator.pushNamed(
    //   context, 
    //   '/user_screen', 
    //   arguments: userEntity,
    // );
  }

  void _showSnackbar(BuildContext context, String message, [bool isError = false]) {
    SnackbarApp.showSnackbarApp(
      context: context,
      message: message,
      backgroundColor: Theme.of(
        context
      ).colorScheme.onBackground.withAlpha(200),
      isError: isError,
    );
  }
}