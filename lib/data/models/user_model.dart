import '../../domain/domain.dart';
import '../mapper/mapper.dart';
import 'models.dart';

class UserModel {
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
  final List<EmailModel> emails;
  final List<PhoneModel> phones;
  final List<AddressModel> addresses;

  UserModel(
      {required this.access,
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
      required this.addresses});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userMap = json['user'];

    return UserModel(
      access: json['access'],
      refresh: json['refresh'],
      expireIn: json['expireIn'],
      id: userMap['id'],
      avatarUrl: userMap['avatarUrl'],
      name: userMap['name'],
      firstName: userMap['firstName'],
      lastName: userMap['lastName'],
      taxpayerId: userMap['taxpayerId'],
      taxpayerIdFormatted: userMap['taxpayerIdFormatted'],
      identityDocument: userMap['identityDocument'],
      birthday: userMap['birthday'],
      isBlocked: userMap['isBlocked'],
      isStaff: userMap['isStaff'],
      isActive: userMap['isActive'],
      dateJoined: userMap['dateJoined'],
      createdAt: userMap['createdAt'],
      updatedAt: userMap['updatedAt'],
      emails: List<Map<String, dynamic>>.from(userMap['emails'])
          .map(EmailModel.fromJson)
          .toList(),
      phones: List<Map<String, dynamic>>.from(userMap['phones'])
          .map(PhoneModel.fromJson)
          .toList(),
      addresses: List<Map<String, dynamic>>.from(userMap['addresses'])
          .map(AddressModel.fromJson)
          .toList(),
    );
  }

  factory UserModel.fromEntity(entity) => UserModel(
        access: entity.access,
        refresh: entity.refresh,
        expireIn: entity.expireIn,
        id: entity.id,
        avatarUrl: entity.avatarUrl,
        name: entity.name,
        firstName: entity.firstName,
        lastName: entity.lastName,
        isBlocked: entity.isBlocked,
        isStaff: entity.isStaff,
        isActive: entity.isActive,
        dateJoined: entity.dateJoined,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        emails: entity.emails,
        phones: entity.phones,
        addresses: entity.addresses,
      );

  UserEntity toEntity() => UserEntity(
        access: access,
        refresh: refresh,
        expireIn: expireIn,
        id: id,
        avatarUrl: avatarUrl,
        name: name,
        firstName: firstName,
        lastName: lastName,
        isBlocked: isBlocked,
        isStaff: isStaff,
        isActive: isActive,
        dateJoined: dateJoined,
        createdAt: createdAt,
        updatedAt: updatedAt,
        emails: MapperApp.emailEntityFromModel(emails),
        phones: MapperApp.phoneEntityFromModel(phones),
        addresses: MapperApp.addressEntityFromModel(addresses),
      );
}
