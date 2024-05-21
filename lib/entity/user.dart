class User {
  final int? id;
  String name;
  String email;
  final String _password;

  User({this.id, required this.name, required this.email, required String password})
      : _password = password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  String get password => _password;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': _password,
    };
  }
}