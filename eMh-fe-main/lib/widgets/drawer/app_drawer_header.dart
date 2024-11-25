import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/touch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AppDrawerHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? headerAction;
  final VoidCallback onHeaderPressed;
  final Widget? child;
  final bool hasCloseButton;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  const AppDrawerHeader({
    this.title,
    this.subtitle,
    required this.onHeaderPressed,
    this.titleStyle,
    this.subtitleStyle,
    this.headerAction,
    this.child,
    this.hasCloseButton = true,
    this.padding,
    this.backgroundColor = AppColors.light,
  }) : assert(
            (child != null) ||
                (child == null &&
                    title != null &&
                    subtitle != null &&
                    titleStyle != null &&
                    subtitleStyle != null &&
                    headerAction != null),
            'Either provide child and onHeaderPressed, or provide title, subtitle, titleStyle, subtitleStyle, and headerAction');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 258.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyFadedBorder,
            width: 1,
          ),
        ),
      ),
      padding: padding ?? EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              hasCloseButton
                  ? IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 18.dm,
                        color: AppColors.dark,
                      ),
                      onPressed: () => Get.back(),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          Gap(6.h),
          TouchWidget(
            onTap: onHeaderPressed,
            child: child ??
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppConstants.image.avatar,
                      width: 44.w,
                      height: 44.h,
                    ),
                    SizedBox(
                      width: 138.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title ?? '', style: titleStyle),
                          Text(subtitle ?? '', style: subtitleStyle)
                        ],
                      ),
                    ),
                    headerAction ?? SizedBox.shrink(),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
