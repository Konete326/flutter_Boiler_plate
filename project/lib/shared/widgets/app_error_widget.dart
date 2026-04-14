import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
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
        padding: EdgeInsets.all(context.wp(5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: kError, size: context.wp(12)),
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
