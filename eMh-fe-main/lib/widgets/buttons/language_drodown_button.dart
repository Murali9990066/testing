import 'package:e_medfile/features/language/language_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDropdownButton extends StatelessWidget {
  final double? iconSize;
  final Color iconColor;
  const LanguageDropdownButton({
    super.key,
    required this.languageController,
    this.iconSize,
    this.iconColor = AppColors.dark,
  });

  final LanguageController languageController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          AppBottomSheet.showLanguageBottomSheet(languageController),
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.language,
            size: iconSize ?? 24.w,
            color: iconColor,
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: iconSize ?? 24.w,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
