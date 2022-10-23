class AuthEntity {
  final String access;
  final String refresh;
  final String? expireIn;

  AuthEntity({
    required this.access,
    required this.refresh,
    this.expireIn,
  });

  factory AuthEntity.fromMap(Map<String, dynamic> map) => AuthEntity(
        access: map['access'],
        refresh: map['refresh'],
        expireIn: map['expireIn'],
      );
}
