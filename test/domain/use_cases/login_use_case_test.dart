import 'package:clean_arch/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  final AuthRepository = AuthRepositoryMock();
  final LoginCase = LoginCase(repository: AuthRepository);
  final loginEntity = LoginEntity(user: 'user', password: 'password');
  final userEntity = UserEntityFake();

  group('Login use case |', () {
    test('AuthRepository.login method must be called 1 time', () async {
      // arrange
      when(() => AuthRepository.login(loginEntity))
          .thenAnswer((_) async => Right(userEntity));

      // act
      await LoginCase(loginEntity);

      // assert
      verify(() => AuthRepository.login(loginEntity)).called(1);
    });

    test('Success: login method must return a UserEntity', () async {
      // arrange
      when(() => AuthRepository.login(loginEntity))
          .thenAnswer((_) async => Right(userEntity));

      // act
      final response = await LoginCase(loginEntity);

      // assert
      expect(response.isRight(), equals(true));
      expect(response.fold(id, id), isA<UserEntity>());
    });

    test('Exception: login method must return a ExceptionApp', () async {
      // arrange
      when(() => AuthRepository.login(loginEntity))
          .thenAnswer((_) async => Left(ServerException()));

      // act
      final response = await LoginCase(loginEntity);

      // assert
      expect(response.isLeft(), equals(true));
      expect(response.fold(id, id), isA<ExceptionApp>());
    });
  });
}
