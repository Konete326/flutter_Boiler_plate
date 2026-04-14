import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_loader.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.photoUrl,
    required this.name,
    this.radius = 48.0,
    required this.onTap,
  });

  final String? photoUrl;
  final String name;
  final double radius;
  final VoidCallback onTap;

  String _getInitials() {
    if (name.trim().isEmpty) return '?';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSurfaceElevated,
              border: Border.all(color: kBorderDark, width: kStrokeWidth),
            ),
            clipBehavior: Clip.antiAlias,
            child: photoUrl != null && photoUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: photoUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: AppLoader()),
                    errorWidget: (context, url, error) => _buildInitials(),
                  )
                : _buildInitials(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(kSpace4),
              decoration: const BoxDecoration(
                color: kPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                size: kSpace16,
                color: kOnPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitials() {
    return Center(
      child: Text(
        _getInitials(),
        style: kHeadingL.copyWith(color: kTextPrimary),
      ),
    );
  }
}
