import '../../domain/domain.dart';
import '../mapper/mapper.dart';
import 'models.dart';

class UserModel {
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
      {required this.id,
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        avatarUrl: json['avatarUrl'],
        name: json['name'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        taxpayerId: json['taxpayerId'],
        taxpayerIdFormatted: json['taxpayerIdFormatted'],
        identityDocument: json['identityDocument'],
        birthday: json['birthday'],
        isBlocked: json['isBlocked'],
        isStaff: json['isStaff'],
        isActive: json['isActive'],
        dateJoined: json['dateJoined'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        emails: List<Map<String, dynamic>>.from(json['emails'])
            .map(EmailModel.fromJson)
            .toList(),
        phones: List<Map<String, dynamic>>.from(json['phones'])
            .map(PhoneModel.fromJson)
            .toList(),
        addresses: List<Map<String, dynamic>>.from(json['addresses'])
            .map(AddressModel.fromJson)
            .toList(),
      );

  factory UserModel.fromEntity(entity) => UserModel(
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
        id: id,
        avatarUrl: avatarUrl,
        name: name,
        firstName: firstName,
        lastName: lastName,
        birthday: birthday,
        identityDocument: identityDocument,
        taxpayerId: taxpayerId,
        taxpayerIdFormatted: taxpayerIdFormatted,
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
