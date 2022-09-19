import '../../domain/domain.dart';
import 'models.dart';

class UserModel {
  final String token;
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

  UserModel({
    required this.token, 
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      token: json['token'],
      refresh: json['refresh'],
      expireIn: json['expireIn'],
      id: json['id'],
      avatarUrl: json['avatar_url'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      taxpayerId: json['taxpayer_id'],
      taxpayerIdFormatted: json['taxpayer_id_formatted'],
      identityDocument: json['identity_document'],
      birthday: json['birthday'],
      isBlocked: json['is_blocked'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: json['date_joined'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      emails: (json['emails'] as List).map((email) => EmailModel.fromJson(email)).toList(),
      phones: (json['phones'] as List).map((phone) => PhoneModel.fromJson(phone)).toList(),
      addresses: (json['addresses'] as List).map((adress) => AddressModel.fromJson(adress)).toList(),
    );

  Map<String, dynamic> toJson() => {
      'user': token,
      'refresh': refresh,
    };

  UserEntity toEntity() => UserEntity(
    token: token, 
    refresh: refresh, 
    expireIn: expireIn, 
    id: id, avatarUrl: 
    avatarUrl, 
    name: name, 
    firstName: firstName, 
    lastName: lastName, 
    isBlocked: isBlocked,
    isStaff: isStaff, 
    isActive: isActive, 
    dateJoined: dateJoined, 
    createdAt: createdAt, 
    updatedAt: updatedAt, 
    emails: emails.map((email) => EmailEntity.fromModel(email)).toList(), 
    phones: phones.map((phone) => PhoneEntity.fromModel(phone)).toList(), 
    addresses: addresses.map((adress) => AddressEntity.fromModel(adress)).toList(),
  );
}