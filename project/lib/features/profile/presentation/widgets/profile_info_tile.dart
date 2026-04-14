import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.showEditIcon = false,
    this.onEdit,
  });

  final String label;
  final String value;
  final IconData? icon;
  final bool showEditIcon;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      borderRadius: BorderRadius.circular(kRadiusS),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSpace12, horizontal: kSpace16),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: kTextSecondary, size: kSpace24),
              const SizedBox(width: kSpace16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: kLabelS.copyWith(color: kTextSecondary),
                  ),
                  const SizedBox(height: kSpace4),
                  Text(
                    value,
                    style: kBodyM.copyWith(color: kTextPrimary),
                  ),
                ],
              ),
            ),
            if (showEditIcon)
              const Icon(Icons.edit, size: kSpace20, color: kTextSecondary),
          ],
        ),
      ),
    );
  }
}
