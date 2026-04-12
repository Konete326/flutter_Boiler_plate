import 'package:flutter/material.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../../../theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kSpace48),
        Text(title, style: kHeadingXL),
        const SizedBox(height: kSpace8),
        Text(subtitle, style: kBodyM.copyWith(color: kTextSecondary)),
        const SizedBox(height: kSpace32),
      ],
    );
  }
}
