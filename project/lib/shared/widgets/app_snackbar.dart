import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class AppSnackbar {
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, kSuccess);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, kError);
  }

  static void showInfo(BuildContext context, String message) {
    _show(context, message, kPrimary);
  }

  static void _show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: kOnPrimary),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
