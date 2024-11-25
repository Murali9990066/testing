import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color backgroundColor;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final double iconSize;
  final EdgeInsets? padding;
  final Size? buttonSize;
  final bool isActive;

  RoundedIconButton({
    required this.icon,
    required this.onPressed,
    this.color = AppColors.greyBorder,
    this.backgroundColor = Colors.transparent,
    this.borderSide,
    this.borderRadius,
    this.iconSize = 16,
    this.padding,
    this.buttonSize,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize?.width ?? 36.w,
      height: buttonSize?.height ?? 36.w,
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(50.r)),
          side: borderSide ?? const BorderSide(color: AppColors.greyBorder, width: 1),
        ),
        child: InkWell(
          onTap: isActive ? onPressed : null,
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(50.r)),
          child: IconButton(
            onPressed: isActive ? onPressed : null, // Set to null if isActive is false
            style: IconButton.styleFrom(
              padding: padding ?? EdgeInsets.all(8.72.w),
            ),
            icon: Icon(
              icon,
              size: iconSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
