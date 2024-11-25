import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;
  final BorderRadius? borderRadius;
  final Border? border;
  final bool isEnabled;
  final TextStyle? textStyle;
  final Color? highlightColor;

  AppButton({
    required this.child,
    required this.onPressed,
    this.buttonColor = AppColors.primary,
    this.textColor = AppColors.light,
    this.fontSize = 16,
    this.borderRadius,
    this.border,
    this.isEnabled = true,
    this.textStyle,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: borderRadius,
        splashColor: AppColors.light.withOpacity(0.2),
        highlightColor: highlightColor ??AppColors.light.withOpacity(0.2),
        child: Ink(
          decoration: BoxDecoration(
            color: isEnabled ? buttonColor : buttonColor.withOpacity(0.45),
            border: border,
            borderRadius: borderRadius,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
            ],
          ),
        ),
      ),
    );
  }

  factory AppButton.text({
    required String text,
    required Function() onPressed,
    Color color = AppColors.secondary,
    Color textColor = AppColors.light,
    double fontSize = 16,
    BorderRadius? borderRadius,
    bool isEnabled = true,
    TextStyle? textStyle,
    Color? highlightColor,
  }) {
    return AppButton(
        onPressed: onPressed,
        buttonColor: color,
        textColor: textColor,
        fontSize: fontSize,
        borderRadius: borderRadius ?? BorderRadius.circular(50.r),
        isEnabled: isEnabled,
        textStyle: textStyle,
        highlightColor: highlightColor,
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Text(text, style: textStyle ?? Get.theme.textTheme.labelLarge!.copyWith(color: textColor)),
        ));
  }

  factory AppButton.textWithLoader({
    required bool isLoading,
    required String text,
    required Function() onPressed,
    Color color = AppColors.primary,
    Color textColor = AppColors.light,
    double fontSize = 16,
    BorderRadius? borderRadius,
    bool isEnabled = true,
    TextStyle? textStyle,
    Color? highlightColor,
  }) {
    return AppButton(
      onPressed: onPressed,
      buttonColor: color,
      textColor: textColor,
      fontSize: fontSize,
      borderRadius: borderRadius,
      isEnabled: isEnabled,
      textStyle: textStyle,
      highlightColor: highlightColor,
      child: Padding(
        padding: EdgeInsets.all(12.0.w),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Text(text, style: textStyle ?? Get.theme.textTheme.labelLarge),
      ),
    );
  }

}
