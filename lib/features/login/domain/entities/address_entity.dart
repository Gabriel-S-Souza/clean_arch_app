class AddressEntity {
  final int id;
  final int userId;
  final String postalCode;
  final String address1;
  final String number;
  final String? address2;
  final String neighborhood;
  final String locality;
  final String state;
  final String createdAt;
  final String updatedAt;

  AddressEntity({
    required this.id, 
    required this.userId, 
    required this.postalCode, 
    required this.address1,
    required this.number, 
    this.address2, 
    required this.neighborhood, 
    required this.locality, 
    required this.state, 
    required this.createdAt, 
    required this.updatedAt
  });
}