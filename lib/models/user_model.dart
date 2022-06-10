class UserModel {
  int id;
  String name;
  String email;
  String phone;
  int numPedidos;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.numPedidos,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['f_name'],
        email: json['email'],
        phone: json['phone'],
        numPedidos: json['order_count']);
  }
}
