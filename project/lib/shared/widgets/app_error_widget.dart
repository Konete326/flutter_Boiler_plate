import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.message,
    this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kSpace16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: kError, size: 48),
            const SizedBox(height: kSpace16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: kBodyM.copyWith(color: kTextPrimary),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: kSpace16),
              TextButton(
                onPressed: onRetry,
                child: Text('Retry', style: kLabelL.copyWith(color: kPrimary)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
