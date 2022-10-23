class PhoneModel {
  final int id;
  final int userId;
  final String phoneType;
  final String phone;
  final String createdAt;
  final String updatedAt;

  PhoneModel({
    required this.id,
    required this.userId,
    required this.phoneType, 
    required this.phone, 
    required this.createdAt, 
    required this.updatedAt
  });

  factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
      id: json['id'],
      userId: json['userId'],
      phoneType: json['phoneType'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
}