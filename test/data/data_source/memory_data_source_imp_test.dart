import 'package:clean_arch/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userModel = getUserModelFake();

  late MemoryDataSource memoryDataSource;
  setUp(() {
    memoryDataSource = MemoryDataSourceImp();
  });

  group('Memory data source imp |', () {
    test('getCurrentUser method should return a UserModel or null', () {
      // arrange
      memoryDataSource.putCurrentUser(userModel);

      // act
      final response = memoryDataSource.getCurrentUser();

      // assert
      expect(response, isA<UserModel>());
    });

    test(
        'putCurrentUser should update the _currentUser property which will make getCurrentUser method return the updated value',
        () {
      // arrange
      memoryDataSource.putCurrentUser(userModel);
      final newUserModel = getUserModelFake2();

      //act
      memoryDataSource.putCurrentUser(newUserModel);

      // assert
      expect(memoryDataSource.getCurrentUser(), isNot(equals(userModel)));
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

UserModel getUserModelFake2() => UserModel(
      access: 'access2',
      refresh: 'refresh2',
      expireIn: 'expireIn2',
      id: 1,
      avatarUrl: 'avatarUrl2',
      name: 'name2',
      firstName: 'firstName2',
      lastName: 'lastName2',
      isBlocked: false,
      isStaff: false,
      isActive: false,
      dateJoined: 'dateJoined2',
      createdAt: 'createdAt2',
      updatedAt: 'updatedAt2',
      emails: <EmailModel>[],
      phones: <PhoneModel>[],
      addresses: <AddressModel>[],
    );
