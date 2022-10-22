import 'package:clean_arch/data/data.dart';
import 'package:clean_arch/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MemoryDataSourceMock extends Mock implements MemoryDataSource {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  final memoryDataSource = MemoryDataSourceMock();
  final memoryRepositoryImp = MemoryRepositoryImp(dataSource: memoryDataSource);
  final userModel = getUserModelFake();

  group('Memory repository |', () {
    test(
        'when run getCurrentUser metohd, MemoryDataSource.getCurrentUser method must be called 1 time',
        () {
      // arrange
      when(() => memoryDataSource.getCurrentUser()).thenReturn(userModel);

      // act
      memoryRepositoryImp.getCurrentUser();

      // assert
      verify(() => memoryDataSource.getCurrentUser()).called(1);
    });

    test('MemoryRepository.getCurrentUser method should return a UserEntity or null', () {
      // arrange
      when(() => memoryDataSource.getCurrentUser()).thenReturn(userModel);

      // act
      final response = memoryRepositoryImp.getCurrentUser();

      // assert
      expect(response, isA<UserEntity>());
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
