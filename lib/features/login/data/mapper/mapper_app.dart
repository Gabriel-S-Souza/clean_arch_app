import '../../domain/domain.dart';
import '../data.dart';

class MapperApp {
  static List<EmailEntity> emailEntityFromModel(List<EmailModel> emails) =>
      emails.map((email) => EmailEntity(
        id: email.id,
        userId: email.userId,
        email: email.email,
        primary: email.primary,
        verified: email.verified
      )).toList();

  static List<PhoneEntity> phoneEntityFromModel(List<PhoneModel> phones) =>
      phones.map((phone) => PhoneEntity(
        id: phone.id,
        userId: phone.userId,
        phone: phone.phone,
        phoneType: phone.phoneType,
        createdAt: phone.createdAt,
        updatedAt: phone.updatedAt,
      )).toList();

  static List<AddressEntity> addressEntityFromModel(List<AddressModel> addresses) =>
      addresses.map((address) => AddressEntity(
        id: address.id,
        userId: address.userId,
        address1: address.address1,
        address2: address.address2,
        number: address.number,
        locality: address.locality,
        neighborhood: address.neighborhood,
        postalCode: address.postalCode,
        state: address.state,
        createdAt: address.createdAt,
        updatedAt: address.updatedAt,
      )).toList();
}