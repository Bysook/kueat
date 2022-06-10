class SignUpModel {
  String name;
  String telefono;
  String email;
  String pass;

  SignUpModel({
    required this.name,
    required this.telefono,
    required this.email,
    required this.pass,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["phone"] = this.telefono;
    data["email"] = this.email;
    data["password"] = this.pass;
    return data;
  }
}
