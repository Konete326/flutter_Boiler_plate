import 'package:flutter/material.dart';

import '../../../theme/app_animations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';

class AppShimmer extends StatefulWidget {
  const AppShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = kRadiusS,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: kDurationShimmer,
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: kSurfaceDark,
      end: kSurfaceElevated,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );
      },
    );
  }
}
