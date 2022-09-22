import '../../data/data.dart';

class UserEntity {
  final String access;
  final String refresh;
  final String expireIn;
  final int id;
  final String avatarUrl;
  final String name;
  final String firstName;
  final String lastName;
  final String? taxpayerId;
  final String? taxpayerIdFormatted;
  final String? identityDocument;
  final String? birthday;
  final bool isBlocked;
  final bool isStaff;
  final bool isActive;
  final String dateJoined;
  final String createdAt;
  final String updatedAt;
  final List<EmailEntity> emails;
  final List<PhoneEntity> phones;
  final List<AddressEntity> addresses;

  UserEntity({
    required this.access, 
    required this.refresh, 
    required this.expireIn, 
    required this.id, 
    required this.avatarUrl, 
    required this.name, 
    required this.firstName, 
    required this.lastName, 
    this.taxpayerId, 
    this.taxpayerIdFormatted, 
    this.identityDocument, 
    this.birthday, 
    required this.isBlocked, 
    required this.isStaff, 
    required this.isActive, 
    required this.dateJoined, 
    required this.createdAt, 
    required this.updatedAt, 
    required this.emails, 
    required this.phones, 
    required this.addresses
  });
}

class EmailEntity {
  final int id;
  final int userId;
  final String email;
  final bool verified;
  final bool primary;

  EmailEntity({
    required this.id, 
    required this.userId, 
    required this.email, 
    required this.verified, 
    required this.primary
  });

  factory EmailEntity.fromModel(EmailModel emailModel) => EmailEntity(
      id: emailModel.id,
      userId: emailModel.userId,
      email: emailModel.email,
      verified: emailModel.verified,
      primary: emailModel.primary,
    );
}

class PhoneEntity {
  final int id;
  final int userId;
  final String phoneType;
  final String phone;
  final String createdAt;
  final String updatedAt;

  PhoneEntity({
    required this.id,
    required this.userId,
    required this.phoneType, 
    required this.phone, 
    required this.createdAt, 
    required this.updatedAt
  });

  factory PhoneEntity.fromModel(PhoneModel phoneModel) => PhoneEntity(
      id: phoneModel.id,
      userId: phoneModel.userId,
      phone: phoneModel.phone,
      phoneType: phoneModel.phoneType,
      createdAt: phoneModel.createdAt,
      updatedAt: phoneModel.updatedAt,
    );
}

class AddressEntity {
  final int id;
  final int userId;
  final String postalCode;
  final String address1;
  final String number;
  final String? address2;
  final String neighborhood;
  final String locality;
  final String state;
  final String createdAt;
  final String updatedAt;

  AddressEntity({
    required this.id, 
    required this.userId, 
    required this.postalCode, 
    required this.address1,
    required this.number, 
    this.address2, 
    required this.neighborhood, 
    required this.locality, 
    required this.state, 
    required this.createdAt, 
    required this.updatedAt
  });

  factory AddressEntity.fromModel(AddressModel addressModel) => AddressEntity(
      id: addressModel.id,
      userId: addressModel.userId,
      postalCode: addressModel.postalCode,
      address1: addressModel.address1,
      address2: addressModel.address2,
      number: addressModel.number,
      neighborhood: addressModel.neighborhood,
      locality: addressModel.locality,
      state: addressModel.state,
      createdAt: addressModel.createdAt,
      updatedAt: addressModel.updatedAt,
    );
}