import 'package:dartz/dartz.dart';

import '../domain.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase({required LoginRepository repository}) : _repository = repository;

  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity) async =>
      _repository.login(loginEntity);
}
