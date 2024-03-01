import 'en_us/en_us_translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import '../core/app_export.dart';

/// A class that handles localization for the app.
class AppLocalization {
  AppLocalization(this.locale);

  /// The current locale.
  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {'en': enUs};

  /// Retrieves the instance of [AppLocalization].
  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
        NavigatorService.navigatorKey.currentContext!, AppLocalization)!;
  }

  /// Retrieves a list of supported languages.
  static List<String> languages() => _localizedValues.keys.toList();

  /// Retrieves the localized string for the given [text].
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

/// A delegate for the [AppLocalization] class.
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  // Returning a SynchronousFuture here because an async "load" operation
  // would cause an error.
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

/// An extension on [String] that provides a shorthand for retrieving localized strings.
extension LocalizationExtension on String {
  /// Retrieves the localized string for the current [String].
  String get tr => AppLocalization.of().getString(this);
}
