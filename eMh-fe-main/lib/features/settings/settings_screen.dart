import 'package:e_medfile/features/settings/settings_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/app_scaffold.dart';
import 'package:e_medfile/widgets/appbar/custom_appbar.dart';
import 'package:e_medfile/widgets/touch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleText: 'Settings',
      hasInsideBorder: true,
      hasBackButton: true,
      body: ListView.separated(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
            Divider(height: 0.h, color: AppColors.greyFadedBorder),
        itemCount: controller.settingItems.length,
        itemBuilder: (_, index) => TouchWidget(
          onTap: controller.settingItems[index].onTap,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
            minVerticalPadding: 0,
            visualDensity: VisualDensity(vertical: -4),
            trailing: Icon(controller.settingItems[index].icon,
                size: 16.dm, color: AppColors.primary),
            title: Text(controller.settingItems[index].title,
                style: Get.theme.textTheme.labelMedium!
                    .copyWith(color: AppColors.errorText)),
          ),
        ),
      ),
    );
  }
}
