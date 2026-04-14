import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';
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
      padding: EdgeInsets.symmetric(vertical: context.hp(2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message, 
            style: kBodyS.copyWith(
              color: kTextSecondary,
              fontSize: context.wp(3.5),
            ),
          ),
          TextButton(
            onPressed: onAction,
            child: Text(
              actionLabel,
              style: kLabelS.copyWith(
                color: kPrimary,
                fontSize: context.wp(3.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
