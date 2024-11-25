import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/settings/settings_screen.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:e_medfile/widgets/buttons/rounded_icon_button.dart';
import 'package:e_medfile/widgets/drawer/app_drawer_header.dart';
import 'package:e_medfile/widgets/drawer/app_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:e_medfile/theme/color_theme.dart';

class AppDrawer extends StatelessWidget {
  final List<AppDrawerItem> drawerItemsList;
  final bool hasHeader;
  final AppDrawerHeader? drawerHeader;
  final Color backgroundColor;
  final TextStyle? drawerItemTextStyle;
  final bool hasCloseButton;
  final EdgeInsetsGeometry? padding;
  final double? width;

  AppDrawer({
    required this.drawerItemsList,
    this.hasHeader = true,
    this.drawerHeader,
    this.backgroundColor = AppColors.light,
    this.drawerItemTextStyle,
    this.hasCloseButton = true,
    this.padding,
    this.width,
  })  : assert(drawerItemsList.isNotEmpty, 'Drawer items list cannot be empty'),
        assert(!hasHeader || drawerHeader != null,
            'If hasHeader is true, drawerHeader must be provided');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            if (hasHeader) drawerHeader!,
            Gap(17.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: drawerItemsList.length,
                itemBuilder: (context, index) {
                  final item = drawerItemsList[index];
                  return ListTile(
                    horizontalTitleGap: 8.w,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: padding!.horizontal / 2),
                    leading: item.icon,
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18.dm,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      item.title,
                      style: drawerItemTextStyle ??
                          Get.textTheme.labelMedium!.copyWith(
                            color: AppColors.dark,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    onTap: () {
                      Get.back();
                      item.onTap();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  factory AppDrawer.dashboard() {
    var padding = EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h);
    onHeaderPressed() => Get.back();

    return AppDrawer(
      width: 258.w,
      hasHeader: true,
      padding: padding,
      drawerHeader: AppDrawerHeader(
        padding: padding,
        onHeaderPressed: () => Get.toNamed(Routes.profile.name),
        title: 'Manjunatha',
        subtitle: 'View and Edit profile',
        titleStyle: Get.textTheme.headlineLarge!
            .copyWith(fontFamily: FontConfig.poppins),
        subtitleStyle: Get.textTheme.titleSmall!
            .copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
        headerAction: CircleAvatar(
          radius: 14.r,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.keyboard_arrow_right_rounded,
            color: AppColors.light,
            size: 14.dm,
          ),
        ),
        hasCloseButton: true,
      ),
      drawerItemsList: [
        AppDrawerItem(
          icon: Image.asset(
            AppConstants.image.gear,
            width: 18.w,
            height: 18.h,
            fit: BoxFit.fitWidth,
          ),
          title: 'Settings',
          onTap: () => Get.toNamed(Routes.settings.name),
        ),
        AppDrawerItem(
          icon: Image.asset(
            AppConstants.image.notepad,
            width: 18.w,
            height: 18.h,
            fit: BoxFit.fitWidth,
          ),
          title: 'Medical Reports',
          onTap: () => Get.toNamed(Routes.medicalReports.name),
        ),
        AppDrawerItem(
          icon: Image.asset(
            AppConstants.image.helpAndSupport,
            width: 18.w,
            height: 18.h,
            fit: BoxFit.fitWidth,
          ),
          title: 'Help & Support',
          onTap: () {},
        ),
      ],
    );
  }
}
