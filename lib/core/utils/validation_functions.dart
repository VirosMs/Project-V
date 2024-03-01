/// Checks if a string is a valid email address.
///
/// Returns `true` if the [inputString] is a valid email address,
/// or if [isRequired] is `false` and [inputString] is `null` or empty.
/// Otherwise, returns `false`.
bool isValidEmail(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if a string is a valid password.
///
/// Returns `true` if the [inputString] is a valid password,
/// or if [isRequired] is `false` and [inputString] is `null` or empty.
/// Otherwise, returns `false`.
///
/// A valid password should have:
/// - at least one uppercase letter
/// - at least one lowercase letter
/// - at least one digit
/// - at least one special character [@#$%^&+=]
/// - a length of at least 4 characters
/// - no whitespace allowed
bool isValidPassword(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if a string consists only of alphabets (no whitespace).
///
/// Returns `true` if the [inputString] consists only of alphabets (no whitespace),
/// or if [isRequired] is `false` and [inputString] is `null` or empty.
/// Otherwise, returns `false`.
bool isText(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}
