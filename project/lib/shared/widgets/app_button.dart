import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isSecondary = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary ? kSurfaceElevated : kPrimary,
        foregroundColor: isSecondary ? kTextPrimary : Colors.white,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: kLabelL,
            ),
    );
  }
}
