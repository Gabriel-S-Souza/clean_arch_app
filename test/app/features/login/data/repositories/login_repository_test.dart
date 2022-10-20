import 'package:clean_arch/app/features/features.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

void main() {
  final loginDataSource = LoginDataSourceMock();
  final loginRepositoryImp = LoginRepositoryImp(dataSource: loginDataSource);
  final loginEntity = LoginEntity(user: 'user', password: 'password');
  final userModel = getUserModelFake();

  setUpAll(() {
    registerFallbackValue(LoginModel(user: 'user', password: 'password'));
  });

  group('Login repository |', () {
    test('LoginDataSource.login method must be called 1 time', () async {
      // arrange
      when(() => loginDataSource.login(any())).thenAnswer((_) async => userModel);

      // act
      await loginRepositoryImp.login(loginEntity);

      // assert
      verify(() => loginDataSource.login(any())).called(1);
    });

    test('Success: login method must return a Right(UserEntity)', () async {
      // arrange
      when(() => loginDataSource.login(any())).thenAnswer((_) async => userModel);

      // act
      final response = await loginRepositoryImp.login(loginEntity);

      // assert
      expect(response.isRight(), equals(true));
      expect(response.fold(id, id), isA<UserEntity>());
    });

    test(
        'Error: when loginDataSource.login method throws an ExceptionApp, should return a Left(ExceptionApp)',
        () async {
      // arrange
      when(() => loginDataSource.login(any())).thenThrow(CredentialsException());

      // act
      final response = await loginRepositoryImp.login(loginEntity);

      // assert
      expect(response.isLeft(), equals(true));
      expect(response.fold(id, id), isA<CredentialsException>());
    });
  });
}

UserModel getUserModelFake() => UserModel(
      access: 'access',
      refresh: 'refresh',
      expireIn: 'expireIn',
      id: 1,
      avatarUrl: 'avatarUrl',
      name: 'name',
      firstName: 'firstName',
      lastName: 'lastName',
      isBlocked: false,
      isStaff: false,
      isActive: false,
      dateJoined: 'dateJoined',
      createdAt: 'createdAt',
      updatedAt: 'updatedAt',
      emails: <EmailModel>[],
      phones: <PhoneModel>[],
      addresses: <AddressModel>[],
    );
