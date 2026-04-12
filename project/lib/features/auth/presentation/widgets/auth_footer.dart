import 'package:flutter/material.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_typography.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    required this.message,
    required this.actionLabel,
    required this.onAction,
    super.key,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpace24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: kBodyS.copyWith(color: kTextSecondary)),
          TextButton(
            onPressed: onAction,
            child: Text(
              actionLabel,
              style: kLabelS.copyWith(color: kPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
