import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontConfig {
  static const String plusJakartaSans = 'Plus Jakarta Sans';
  static const String poppins = 'Poppins';
  static const String lora = 'Lora';

  static TextStyle primary({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    String fontFamily = plusJakartaSans,
  }) =>
      GoogleFonts.getFont(
        fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle secondary({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    String fontFamily = poppins,
  }) =>
      GoogleFonts.getFont(
        fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle tertiary({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    String fontFamily = lora,
  }) {
    return GoogleFonts.getFont(
      fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}

// Add more text styles as needed
class CustomTextTheme {
  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: FontConfig.primary(
        fontSize: 22,
        color: AppColors.light,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: FontConfig.primary(
        fontSize: 20,
        color: AppColors.light,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: FontConfig.primary(
        fontSize: 18,
        color: AppColors.light,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: FontConfig.primary(
        fontSize: 18,
        color: AppColors.dark,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: FontConfig.primary(
        fontSize: 16,
        color: AppColors.dark,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: FontConfig.primary(
        fontSize: 14,
        color: AppColors.dark,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: FontConfig.primary(
        fontSize: 16,
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: FontConfig.primary(
        fontSize: 14,
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: FontConfig.primary(
        fontSize: 12,
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: FontConfig.tertiary(
        fontSize: 16,
        color: AppColors.dark,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: FontConfig.tertiary(
        fontSize: 14,
        color: AppColors.dark,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: FontConfig.tertiary(
        fontSize: 12,
        color: AppColors.dark,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: FontConfig.secondary(
        fontSize: 16,
        color: AppColors.light,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: FontConfig.secondary(
        fontSize: 14,
        color: AppColors.light,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: FontConfig.secondary(
        fontSize: 12,
        color: AppColors.light,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextTheme get darkTextTheme {
    return TextTheme(
      displayLarge: FontConfig.primary(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: FontConfig.primary(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: FontConfig.primary(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: FontConfig.primary(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: FontConfig.primary(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: FontConfig.primary(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: FontConfig.primary(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: FontConfig.primary(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: FontConfig.primary(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: FontConfig.tertiary(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: FontConfig.tertiary(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: FontConfig.tertiary(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: FontConfig.secondary(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: FontConfig.secondary(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: FontConfig.secondary(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
