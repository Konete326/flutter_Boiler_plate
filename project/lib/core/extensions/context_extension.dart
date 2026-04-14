import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double wp(double percent) => screenWidth * (percent / 100);
  double hp(double percent) => screenHeight * (percent / 100);

  bool get isMobile => screenWidth <= 600;
  bool get isTablet => screenWidth > 600 && screenWidth <= 1024;
  bool get isDesktop => screenWidth > 1024;

  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;
}
