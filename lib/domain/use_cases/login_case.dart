import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class LoginCase {
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity);
  Future<Either<ExceptionApp, UserEntity>> getUser();
}

class LoginCaseImp implements LoginCase {
  final AuthRepository _repository;
  final SaveAuthDataCase _saveAuthDataCase;

  LoginCaseImp({
    required AuthRepository repository,
    required SaveAuthDataCase saveAuthDataCase,
  })  : _repository = repository,
        _saveAuthDataCase = saveAuthDataCase;

  @override
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity) async {
    final response = await _repository.login(loginEntity);
    return response.fold(
      (l) => left(l),
      (r) async {
        await _saveAuthDataCase.saveAuthData(AuthEntity.fromMap(r.body!));
        return right(_repository.userEntityFromMap(r.body!['user']));
      },
    );
  }

  @override
  Future<Either<ExceptionApp, UserEntity>> getUser() async =>
      (await _repository.getUser()).fold(
        (l) async {
          if (l.statusCode == 403) {
            await _repository.updateAccessToken();
            return (await _repository.getUser()).fold(
              (l) => left(l),
              (r) {
                log('token renovado!!!!!!!!');
                return right(r);
              },
            );
          } else {
            return left(l);
          }
        },
        (r) => right(r),
      );
}
