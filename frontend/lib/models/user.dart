class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String role;

  User({this.id, required this.name, required this.email, required this.password, required this.phone, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'].toString(),
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'role': role,
    };
  }
}
