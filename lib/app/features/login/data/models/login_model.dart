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

  Map<String, dynamic> toJson() => {
      'user': user,
      'password': password
    };
}