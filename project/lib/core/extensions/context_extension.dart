import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double wp(double percent) => screenWidth * (percent / 100);
  double hp(double percent) => screenHeight * (percent / 100);

  bool get isMobile => screenWidth <= AppConstants.tabletBreakpoint;
  bool get isTablet => screenWidth > AppConstants.tabletBreakpoint && screenWidth <= AppConstants.desktopBreakpoint;
  bool get isDesktop => screenWidth > AppConstants.desktopBreakpoint;

  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;
}
