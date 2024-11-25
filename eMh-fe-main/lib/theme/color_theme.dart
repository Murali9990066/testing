import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromRGBO(4, 141, 197, 1);
  static const Color darkPrimaryText = Color.fromRGBO(15, 43, 74, 1);
  static const Color darkPrimaryLightText = Color.fromRGBO(30, 66, 138, 1);
  static const Color secondary = Color.fromRGBO(13, 79, 109, 1);
  static const Color darkSecondaryDisabled = Color.fromRGBO(13, 79, 109, .45);
  static const Color greyFadedBorder = Color.fromRGBO(227, 227, 227, 1);
  static const Color greyBorder = Color.fromRGBO(180, 180, 180, 1);
  // static const Color greyFadedText = Color.fromRGBO(255, 255, 255, 1);
  static const Color greyText = Color.fromRGBO(132, 130, 130, 1);
  static const Color darkgreyText = Color.fromRGBO(104, 104, 104, 1);
  static const Color lightGreyText = Color.fromRGBO(241, 243, 245, 1);
  static const Color disabledText = Color.fromRGBO(132, 130, 130, 1);
  static const Color darkTextFaded = Color.fromRGBO(35, 35, 35, 1);
  static const Color errorText = Color.fromRGBO(225, 50, 33, 1);
  static const Color light = Color.fromRGBO(255, 255, 255, 1);
  static const Color dark = Color.fromRGBO(0, 0, 0, 1);

  // Add more color definitions as needed
}

class ColorTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.primary,
        error: AppColors.errorText,
      ),
      // Add more theme properties as needed
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.darkPrimaryText,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimaryText,
        secondary: AppColors.secondary,
        surface: AppColors.darkPrimaryLightText,
        error: AppColors.errorText,
      ),
      // Add more theme properties as needed
    );
  }
}
