import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kHeadingS.copyWith(color: kTextSecondary),
        ),
        const SizedBox(height: kSpace8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          style: kBodyM.copyWith(color: kTextPrimary),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: kBodyM.copyWith(color: kTextDisabled),
          ),
        ),
      ],
    );
  }
}
