import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isSecondary = false,
    this.isText = false,
    this.isDisabled = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isSecondary;
  final bool isText;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    if (isText) {
      return SizedBox(
        width: double.infinity,
        height: context.hp(6),
        child: TextButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: isDisabled ? kTextDisabled : kPrimary,
          ),
          child: isLoading
              ? const SizedBox(
                  height: kSpace20,
                  width: kSpace20,
                  child: CircularProgressIndicator(
                    strokeWidth: kStrokeWidth,
                    color: kPrimary,
                  ),
                )
              : Text(
                  text,
                  style: kLabelL,
                ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: context.hp(6),
      child: ElevatedButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled ? kSurfaceElevated : (isSecondary ? kSurfaceElevated : kPrimary),
          foregroundColor: isDisabled ? kTextDisabled : (isSecondary ? kTextPrimary : kOnPrimary),
        ),
        child: isLoading
            ? const SizedBox(
                height: kSpace20,
                width: kSpace20,
                child: CircularProgressIndicator(
                  strokeWidth: kStrokeWidth,
                  color: kOnPrimary,
                ),
              )
            : Text(
                text,
                style: kLabelL,
              ),
      ),
    );
  }
}
