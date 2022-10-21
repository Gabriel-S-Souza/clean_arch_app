import 'package:clean_arch/app/features/features.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  final loginRepository = LoginRepositoryMock();
  final loginUseCase = LoginUseCase(repository: loginRepository);
  final loginEntity = LoginEntity(user: 'user', password: 'password');
  final userEntity = UserEntityFake();

  group('Login use case |', () {
    test('LoginRepository.login method must be called 1 time', () async {
      // arrange
      when(() => loginRepository.login(loginEntity))
          .thenAnswer((_) async => Right(userEntity));

      // act
      await loginUseCase.login(loginEntity);

      // assert
      verify(() => loginRepository.login(loginEntity)).called(1);
    });

    test('Success: login method must return a Right(UserEntity)', () async {
      // arrange
      when(() => loginRepository.login(loginEntity))
          .thenAnswer((_) async => Right(userEntity));

      // act
      final response = await loginUseCase.login(loginEntity);

      // assert
      expect(response.isRight(), equals(true));
      expect(response.fold(id, id), isA<UserEntity>());
    });

    test('Exception: login method must return a Left(ExceptionApp)', () async {
      // arrange
      when(() => loginRepository.login(loginEntity))
          .thenAnswer((_) async => Left(CredentialsException()));

      // act
      final response = await loginUseCase.login(loginEntity);

      // assert
      expect(response.isLeft(), equals(true));
      expect(response.fold(id, id), isA<ExceptionApp>());
    });
  });
}
