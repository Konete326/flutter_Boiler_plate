import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import 'app_loader.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.text = '',
  });

  final Widget child;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: kBackgroundDark.withAlpha(204),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLoader(),
                if (text.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    text,
                    style: kBodyS.copyWith(color: kTextSecondary),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
