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