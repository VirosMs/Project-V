import 'package:flutter/material.dart';
import 'package:project_v/main.dart';

/// Represents an exception that occurs when there is an issue with the server.
class ServerException implements Exception {}

/// Represents an exception that occurs when there is an issue with the cache.
class CacheException implements Exception {}

/// Represents an exception that occurs when there is a network issue.
class NetworkException implements Exception {}

/// Represents an exception that occurs when there is no internet connection.
/// Can be used for throwing [NoInternetException].
class NoInternetException implements Exception {
  late String _message;

  /// Constructs a new [NoInternetException] with an optional [message].
  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
