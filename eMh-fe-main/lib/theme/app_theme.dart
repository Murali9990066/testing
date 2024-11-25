import 'package:flutter/material.dart';
import 'color_theme.dart';
import 'font_config.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ColorTheme.lightTheme.copyWith(
      textTheme: CustomTextTheme.textTheme,
    );
  }

  static ThemeData get darkTheme {
    return ColorTheme.darkTheme.copyWith(
      textTheme: CustomTextTheme.darkTextTheme,
    );
  }
}
