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