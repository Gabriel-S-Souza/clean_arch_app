import 'package:clean_arch/app/features/features.dart';
import 'package:clean_arch/app/features/login/data/mapper/mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Mapper app |', () {
    test('The emailEntityFromModel method must return a List<EmailEntity>', () {
      // arrange
      final emailModel = getEmailModelFake();
      final emailModelList = [emailModel, emailModel, emailModel];

      // act
      final response = MapperApp.emailEntityFromModel(emailModelList);

      // assert
      expect(response, isA<List<EmailEntity>>());
    });

    test('The phoneEntityFromModel method must return a List<PhoneEntity>', () {
      // arrange
      final phoneModel = getPhoneModelFake();
      final phoneModelList = [phoneModel, phoneModel, phoneModel];

      // act
      final response = MapperApp.phoneEntityFromModel(phoneModelList);

      // assert
      expect(response, isA<List<PhoneEntity>>());
    });

    test('The addressEntityFromModel method must return a List<AddressEntity>', () {
      // arrange
      final addressModel = getAddressModelFake();
      final addressModelList = [addressModel, addressModel, addressModel];

      // act
      final response = MapperApp.addressEntityFromModel(addressModelList);

      // assert
      expect(response, isA<List<AddressEntity>>());
    });
  });
}

EmailModel getEmailModelFake() => EmailModel(
      id: 1,
      userId: 1,
      email: 'email',
      verified: true,
      primary: true,
    );

PhoneModel getPhoneModelFake() => PhoneModel(
      id: 1,
      userId: 1,
      phoneType: 'phoneType',
      phone: '12345678',
      createdAt: 'createdAt',
      updatedAt: 'updatedAt',
    );

AddressModel getAddressModelFake() => AddressModel(
      id: 1,
      userId: 1,
      postalCode: 'postalCode',
      address1: 'address1',
      number: 'number',
      neighborhood: 'neighborhood',
      locality: 'locality',
      state: 'state',
      createdAt: 'createdAt',
      updatedAt: 'updatedAt',
    );
