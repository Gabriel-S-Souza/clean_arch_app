import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

class LoginUser {
  final LoginRepository _repository;

  LoginUser({required LoginRepository repository}) : _repository = repository;

  Future<Either<ExceptionApp, UserEntity>> loginUserMethod(LoginModel loginModel) async =>
      _repository.login(loginModel);
}