import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';

/// A utility class for managing progress dialog.
class ProgressDialogUtils {
  static bool isProgressVisible = false;

  /// Shows a progress dialog.
  ///
  /// The [context] parameter is the build context of the current widget.
  /// The [isCancellable] parameter determines whether the dialog can be cancelled by tapping outside.
  static void showProgressDialog({BuildContext? context, isCancellable = false}) async {
    if (!isProgressVisible &&
        NavigatorService.navigatorKey.currentState?.overlay?.context != null) {
      showDialog(
          barrierDismissible: isCancellable,
          context: NavigatorService.navigatorKey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            );
          });
      isProgressVisible = true;
    }
  }

  /// Hides the progress dialog.
  static void hideProgressDialog() {
    if (isProgressVisible)
      Navigator.pop(
          NavigatorService.navigatorKey.currentState!.overlay!.context);
    isProgressVisible = false;
  }
}
