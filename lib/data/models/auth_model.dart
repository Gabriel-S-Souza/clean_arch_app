import '../../domain/domain.dart';

class AuthModel {
  final String access;
  final String refresh;
  final String? expireIn;

  AuthModel({
    required this.access,
    required this.refresh,
    this.expireIn,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        access: json['access'],
        refresh: json['refresh'],
        expireIn: json['expireIn'],
      );

  factory AuthModel.fromEntity(AuthEntity entity) => AuthModel(
      access: entity.access, refresh: entity.refresh, expireIn: entity.expireIn);

  AuthEntity toEntity() => AuthEntity(
        access: access,
        refresh: refresh,
        expireIn: expireIn,
      );
}
