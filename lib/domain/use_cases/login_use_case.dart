import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class LoginUseCase {
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity);
  Future<Either<ExceptionApp, UserEntity>> getUser();
  Future<void> saveAuthData(AuthEntity authEntity);
  UserEntity? getSessionUser();
  void putSessionUser(UserEntity user);
}

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository _repository;

  LoginUseCaseImp({required LoginRepository repository}) : _repository = repository;

  @override
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity) async {
    final response = await _repository.login(loginEntity);
    return response.fold(
      (l) => left(l),
      (r) async {
        await saveAuthData(AuthEntity.fromMap(r.body!));
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

  @override
  Future<void> saveAuthData(AuthEntity authEntity) async {
    await _repository.saveAuthData(authEntity);
  }

  @override
  UserEntity? getSessionUser() => _repository.getSessionUser();

  @override
  void putSessionUser(UserEntity user) => _repository.putSessionUser(user);
}
