import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_v/entity/user.dart';

class ApiClient {
  final String _url = 'http://10.0.2.2:8080/lv/api/u';

  Future<User> getUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email or password is empty');
    }

    var uri = Uri.parse('$_url/user/e');

    var response = await http.get(uri, headers: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else if (response.statusCode == 400) {
      throw Exception('Bad Request');
    } else if (response.statusCode == 500) {
      throw Exception('Internal Server Error');
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<bool> createUser(User user) async {
    if (user.email.isEmpty || user.name.isEmpty || user.password.isEmpty) {
      throw Exception('Email, name or password is empty');
    }

    var uri = Uri.parse('$_url/user/');

    var response = await http.post(uri, headers: {
      'Content-Type': 'application/json',
    }, body: jsonEncode(user.toJson()));

    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      throw Exception('Bad Request');
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else if (response.statusCode == 409) {
      throw Exception('Conflict');
    } else if (response.statusCode == 500) {
      throw Exception('Internal Server Error');
    } else {
      throw Exception('Failed to create user');
    }
  }
}
