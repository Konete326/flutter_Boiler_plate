import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.label,
    this.subtitle,
    required this.leadingIcon,
    this.trailingWidget,
    this.onTap,
    this.iconColor,
    this.labelColor,
  });

  final String label;
  final String? subtitle;
  final IconData leadingIcon;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpace16, vertical: kSpace12),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: iconColor ?? kTextSecondary,
              size: 24,
            ),
            const SizedBox(width: kSpace16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: kBodyM.copyWith(color: labelColor ?? kTextPrimary),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: kSpace2),
                    Text(
                      subtitle!,
                      style: kBodyS.copyWith(color: kTextSecondary),
                    ),
                  ],
                ],
              ),
            ),
            if (trailingWidget != null)
              trailingWidget!
            else if (onTap != null)
              const Icon(
                Icons.chevron_right,
                color: kTextDisabled,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
