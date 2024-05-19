import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_v/core/app_export.dart';
import 'package:project_v/entity/user.dart';
import 'package:logger/logger.dart' as logger_package;

logger_package.Logger logger = logger_package.Logger();

class ApiClient {
  final String _url = 'http://10.0.2.2:8080/lv/api/u';

  Future<User> getUser(String email, String password) async {
    logger.i('Getting user: $email, $password');
    if (email.isEmpty || password.isEmpty) {
      throw Exception('err_msg_email_or_password_is_empty'.tr);
    }

    var uri = Uri.parse('$_url/user/e');

    var response = await http.get(uri, headers: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      logger.i('User found');
      return User.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      logger.e('User not found: ${response.body}');
      throw Exception('err_msg_user_not_found'.tr);
    } else if (response.statusCode == 401) {
      logger.e('Unauthorized: ${response.body}');
      throw Exception('err_msg_unauthorized'.tr);
    } else if (response.statusCode == 400) {
      logger.e('Bad Request: ${response.body}');
      throw Exception('err_msg_bad_request'.tr);
    } else if (response.statusCode == 500) {
      logger.e('Internal Server Error: ${response.body}');
      throw Exception('err_msg_internal_server_error'.tr);
    } else {
      throw Exception('Failed to load user: ${response.body}');
    }
  }

  Future<bool> createUser(User user) async {
    logger.i('Creating user: ${user.toJson()}');

    await checkApiConnection().catchError((e) => throw e);

    if (user.email.isEmpty || user.name.isEmpty || user.password.isEmpty) {
      throw Exception('err_msg_email_name_or_password_is_empty'.tr);
    }

    var uri = Uri.parse('$_url/user/');

    var response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()));

    if (response.statusCode == 201) {
      logger.i('User created');
      return true;
    } else if (response.statusCode == 400) {
      logger.e('Bad Request: ${response.body}');
      throw Exception('err_msg_bad_request'.tr);
    } else if (response.statusCode == 401) {
      logger.e('Unauthorized: ${response.body}');
      throw Exception('err_msg_unauthorized'.tr);
    } else if (response.statusCode == 409) {
      logger.e('Conflict: ${response.body}');
      throw Exception('err_msg_conflict'.tr);
    } else if (response.statusCode == 500) {
      logger.e('Internal Server Error: ${response.body}');
      throw Exception('err_msg_internal_server_error'.tr);
    } else {
      throw Exception('Failed to create user: ${response.body}');
    }
  }

  Future<void> checkApiConnection() async {
    var uri = Uri.parse('$_url/');

    try {
      logger.i('Checking API connection');
      var response = await http.get(uri).timeout(Duration(seconds: 15));
      logger.i('API connection response: $response');
      logger.i('API connection successful $response.statusCode');
    } catch (e) {
      if (e is TimeoutException) {
        throw Exception('err_msg_timeout'.tr);
      } else {
        throw Exception('Failed to connect to API: $e');
      }
    }
  }
}
