import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase({required LoginRepository repository}) : _repository = repository;

  Future<Either<ExceptionApp, UserEntity>> login(LoginModel loginModel) async =>
      _repository.login(loginModel);
}