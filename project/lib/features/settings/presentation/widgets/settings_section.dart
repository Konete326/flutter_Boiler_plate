import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.tiles,
  });

  final String title;
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpace16, vertical: kSpace8),
          child: Text(
            title,
            style: kLabelL.copyWith(color: kPrimary),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: kSpace16, vertical: kSpace8),
          decoration: BoxDecoration(
            color: kSurfaceDark,
            borderRadius: BorderRadius.circular(kRadiusM),
            border: Border.all(color: kBorderDark),
          ),
          child: Column(
            children: [
              for (int i = 0; i < tiles.length; i++) ...[
                tiles[i],
                if (i < tiles.length - 1)
                  const Divider(color: kBorderDark, height: 1),
              ]
            ],
          ),
        ),
        const SizedBox(height: kSpace16),
      ],
    );
  }
}
