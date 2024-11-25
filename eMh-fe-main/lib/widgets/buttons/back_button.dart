import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/buttons/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  final Function()? onBackPressed;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final double iconSize;
  final double borderRadius;
  final Size? buttonSize;
  
  const AppBackButton({
    this.onBackPressed,
    this.backgroundColor = AppColors.light,
    this.iconColor = AppColors.dark,
    this.icon = Icons.arrow_back,
    this.iconSize = 20,
    this.borderRadius = 12,
    this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedIconButton(
        buttonSize: buttonSize,
        onPressed: onBackPressed ?? () => Get.back(),
        icon: icon,
        iconSize: iconSize,
        color: iconColor,
        borderSide: BorderSide.none,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(8.w),
      ),
    );
  }
}
