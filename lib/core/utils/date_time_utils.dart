import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Returns a string representing [date] formatted according to the specified [pattern] and [locale].
  ///
  /// If [locale] is provided, it initializes the date formatting for that locale using `initializeDateFormatting`.
  /// The [pattern] parameter specifies the format of the resulting string representation of the date.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// String formattedDate = now.format(pattern: 'dd/MM/yyyy', locale: 'en_US');
  /// print(formattedDate); // Output: 01/01/2022
  /// ```
  String format({
    String pattern = dateTimeFormatPattern,
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}
