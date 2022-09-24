import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase 
    with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginUseCase _loginUseCase;
  LoginControllerBase({required LoginUseCase loginUseCase}) : _loginUseCase = loginUseCase;

  final formKey = GlobalKey<FormState>();

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
  
  @observable
  bool isLoading = false;

  @computed
  bool get isValidForm => Validator.validateUser(user) == null
      && Validator.validatePassword(password) == null;

  Future<void> login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      isLoading = true;

      final loginModel = LoginEntity(user: user, password: password);
      final response = await _loginUseCase.login(loginModel);

      response.fold(
        (exception) => _showSnackbar(context, exception.message ?? 'Houve um erro'), 
        (userResponse) => _goToUserScreen(context, userResponse)
      );

      isLoading = false;
    }
  }

  void _goToUserScreen(BuildContext context, UserEntity userEntity) {
    Navigator.pushNamed(
      context, 
      '/profile', 
      arguments: userEntity
          ..usename = user,
    );
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