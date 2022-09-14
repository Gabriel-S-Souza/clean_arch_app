class UserEntity {
  final String token;
  final String refreshToken;
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
    required this.token, 
    required this.refreshToken, 
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
}

class AddressEntity {
  final int id;
  final int userId;
  final String postalCode;
  final String address1;
  final int number;
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
}