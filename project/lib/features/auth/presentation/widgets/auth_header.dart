import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

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
        SizedBox(height: context.hp(5)),
        Text(
          title, 
          style: kHeadingXL.copyWith(fontSize: context.wp(8)),
        ),
        const SizedBox(height: kSpace8),
        Text(
          subtitle, 
          style: kBodyM.copyWith(
            color: kTextSecondary,
            fontSize: context.wp(4),
          ),
        ),
        SizedBox(height: context.hp(4)),
      ],
    );
  }
}
