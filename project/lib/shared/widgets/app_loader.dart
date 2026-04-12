import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({this.size = 24.0, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
        ),
      ),
    );
  }
}
