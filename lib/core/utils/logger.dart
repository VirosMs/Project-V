/// A utility class for logging messages.
class Logger {
  static LogMode _logMode = LogMode.debug;

  /// Initializes the logger with the specified log mode.
  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  /// Logs the specified [data] if the log mode is set to debug.
  ///
  /// Optionally, a [stackTrace] can be provided to include additional information.
  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      print("Error: $data$stackTrace");
    }
  }
}

/// An enumeration representing the log mode.
enum LogMode {
  /// Debug mode for logging.
  debug,

  /// Live mode for logging.
  live
}
