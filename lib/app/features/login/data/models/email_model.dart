class EmailModel {
  final int id;
  final int userId;
  final String email;
  final bool verified;
  final bool primary;

  EmailModel({
    required this.id, 
    required this.userId, 
    required this.email, 
    required this.verified, 
    required this.primary
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
      id: json['id'],
      userId: json['user_id'],
      email: json['email'],
      verified: json['verified'],
      primary: json['primary'],
    );
}