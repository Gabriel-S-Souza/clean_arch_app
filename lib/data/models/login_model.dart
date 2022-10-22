import '../../domain/domain.dart';

class LoginModel {
  final String user;
  final String password;

  LoginModel({
    required this.user, 
    required this.password
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      user: json['user'] as String,
      password: json['password']  as String,
    );
  
  factory LoginModel.fromEntity(LoginEntity entity) => LoginModel(
    user: entity.user,
    password: entity.password,
  );

  Map<String, dynamic> toJson() => {
      'username': user,
      'password': password
    };
}