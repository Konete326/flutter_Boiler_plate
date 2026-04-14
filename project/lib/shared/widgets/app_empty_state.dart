import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';
import 'app_button.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onAction,
    this.actionLabel,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onAction;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpace24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kTextSecondary,
              size: context.wp(15),
            ),
            const SizedBox(height: kSpace24),
            Text(
              title,
              style: kHeadingS.copyWith(color: kTextPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: kSpace8),
            Text(
              subtitle,
              style: kBodyM.copyWith(color: kTextSecondary),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (onAction != null && actionLabel != null) ...[
              const SizedBox(height: kSpace32),
              AppButton(
                text: actionLabel!,
                onPressed: onAction,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
