//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// A utility class for managing shared preferences.
class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  /// Constructs a new instance of [PrefUtils].
  ///
  /// Initializes the shared preferences instance.
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  /// Initializes the shared preferences instance.
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  /// Clears all the data stored in the shared preferences.
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  /// Sets the theme data value in the shared preferences.
  ///
  /// - [value]: The theme data value to be set.
  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  /// Retrieves the theme data value from the shared preferences.
  ///
  /// Returns the theme data value if it exists, otherwise returns 'primary'.
  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
