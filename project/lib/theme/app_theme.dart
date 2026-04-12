import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackgroundDark,
        colorScheme: const ColorScheme.dark(
          primary: kPrimary,
          onPrimary: Colors.white,
          secondary: kPrimaryLight,
          surface: kSurfaceDark,
          error: kError,
        ),
        textTheme: TextTheme(
          displayLarge: kHeadingXL.copyWith(color: kTextPrimary),
          displayMedium: kHeadingL.copyWith(color: kTextPrimary),
          titleLarge: kHeadingM.copyWith(color: kTextPrimary),
          titleMedium: kHeadingS.copyWith(color: kTextPrimary),
          bodyLarge: kBodyL.copyWith(color: kTextPrimary),
          bodyMedium: kBodyM.copyWith(color: kTextPrimary),
          bodySmall: kBodyS.copyWith(color: kTextSecondary),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kSurfaceDark,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            borderSide: const BorderSide(color: kBorderDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            borderSide: const BorderSide(color: kBorderDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            borderSide: const BorderSide(color: kPrimary),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimary,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadiusM),
            ),
            elevation: 0,
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackgroundLight,
        colorScheme: const ColorScheme.light(
          primary: kPrimary,
          onPrimary: Colors.white,
          secondary: kPrimaryLight,
          surface: kSurfaceLight,
          error: kError,
        ),
        textTheme: TextTheme(
          displayLarge: kHeadingXL.copyWith(color: kTextPrimaryLight),
          displayMedium: kHeadingL.copyWith(color: kTextPrimaryLight),
          titleLarge: kHeadingM.copyWith(color: kTextPrimaryLight),
          bodyLarge: kBodyL.copyWith(color: kTextPrimaryLight),
          bodyMedium: kBodyM.copyWith(color: kTextPrimaryLight),
          bodySmall: kBodyS.copyWith(color: kTextSecondaryLight),
        ),
      );
}
