import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppChips extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isClickable;
  final VoidCallback? onTap;
  final double? borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double? fontSize;
  const AppChips({
    required this.text,
    this.onTap,
    this.isClickable = false,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.light,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
      ),
      child: Text(
        text,
        style: textStyle ?? Get.theme.textTheme.labelMedium!.copyWith(color: foregroundColor, fontSize: fontSize),
      ),
    );
  }
}
