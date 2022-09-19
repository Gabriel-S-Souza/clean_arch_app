class AddressModel {
  final int id;
  final int userId;
  final String postalCode;
  final String address1;
  final int number;
  final String? address2;
  final String neighborhood;
  final String locality;
  final String state;
  final String createdAt;
  final String updatedAt;

  AddressModel({
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

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'],
      userId: json['user_id'],
      postalCode: json['postal_code'],
      address1: json['address_1'],
      address2: json['address_2'],
      number: json['number'],
      neighborhood: json['neighborhood'],
      locality: json['locality'],
      state: json['state'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
}