import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/clickable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBottomSheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onDonePressed;
  final bool hasDivider;
  final EdgeInsets? padding;
  const AppBottomSheetHeader({
    required this.title,
    this.onDonePressed,
    this.hasDivider = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            children: [
              Text(
                title,
                style: Get.theme.textTheme.headlineLarge!
                    .copyWith(color: AppColors.dark),
              ),
              if (onDonePressed != null) ...[
                const Spacer(),
                ClickableText(
                  'Done',
                  style: Get.theme.textTheme.labelLarge!
                      .copyWith(color: AppColors.primary),
                  onPressed: onDonePressed ?? () => Get.back(),
                )
              ],
            ],
          ),
        ),
        if (hasDivider)
          Divider(
            color: AppColors.greyFadedBorder,
            height: 0.h,
          ),
      ],
    );
  }
}
