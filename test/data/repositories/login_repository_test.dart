import 'package:clean_arch/data/data.dart';
import 'package:clean_arch/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RemoteDataSourceMock extends Mock implements RemoteDataSource {}

void main() {
  final RemoteDataSource = RemoteDataSourceMock();
  final AuthRepositoryImp = AuthRepositoryImp(dataSource: RemoteDataSource);
  final loginEntity = LoginEntity(user: 'user', password: 'password');
  final userModel = getUserModelFake();

  setUpAll(() {
    registerFallbackValue(LoginModel(user: 'user', password: 'password'));
  });

  group('Login repository |', () {
    test('RemoteDataSource.login method must be called 1 time', () async {
      // arrange
      when(() => RemoteDataSource.login(any())).thenAnswer((_) async => userModel);

      // act
      await AuthRepositoryImp.login(loginEntity);

      // assert
      verify(() => RemoteDataSource.login(any())).called(1);
    });

    test('Success: login method must return a UserEntity', () async {
      // arrange
      when(() => RemoteDataSource.login(any())).thenAnswer((_) async => userModel);

      // act
      final response = await AuthRepositoryImp.login(loginEntity);

      // assert
      expect(response.isRight(), equals(true));
      expect(response.fold(id, id), isA<UserEntity>());
    });

    test(
        'Exception: when RemoteDataSource.login method throws an ExceptionApp, should return that ExceptionApp',
        () async {
      // arrange
      when(() => RemoteDataSource.login(any())).thenThrow(CredentialsException());

      // act
      final response = await AuthRepositoryImp.login(loginEntity);

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
