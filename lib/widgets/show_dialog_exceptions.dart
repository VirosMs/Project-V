import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';

class MyDialogExeception {
  final String message;

  MyDialogExeception({required this.message});

  Future<void> showDialogWithDelay(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
            content: Text(message, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Accept'.tr),
            ),
          ],
        ),
      );
    });
  }
}