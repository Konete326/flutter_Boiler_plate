import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.wp(10);
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(
          strokeWidth: kStrokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
        ),
      ),
    );
  }
}
