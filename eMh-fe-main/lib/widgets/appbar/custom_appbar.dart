import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:e_medfile/widgets/buttons/back_button.dart';
import 'package:e_medfile/widgets/buttons/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final bool hasBackButton;
  final bool hasLogoAsTitle;
  final EdgeInsetsGeometry? padding;
  final List<Widget>? actions;
  final double elevation;
  final bool centerTitle;
  final Color backgroundColor;
  final Color foregroundColor;
  final ShapeBorder? shape;
  final double? toolbarHeight;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    this.titleText,
    this.leading,
    this.title,
    this.actions,
    this.hasBackButton = true,
    this.hasLogoAsTitle = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.5),
    this.elevation = 0.0,
    this.centerTitle = true,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.light,
    this.shape,
    this.toolbarHeight,
    this.automaticallyImplyLeading = false,
  })  : assert(
          (titleText != null && title == null && !hasLogoAsTitle) ||
              (titleText == null && title != null && !hasLogoAsTitle) ||
              (titleText == null && title == null && hasLogoAsTitle),
          'Only one of titleText, title, or hasLogoAsTitle must be provided',
        ),
        assert(
          (hasBackButton && leading == null) ||
              (!hasBackButton && leading != null) ||
              (!hasBackButton && leading == null),
          'If hasBackButton is true, leading must be null',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.5.h),
      child: AppBar(
        surfaceTintColor: backgroundColor,
        leading: hasBackButton
            ? const AppBackButton()
            : leading,
        title: hasLogoAsTitle
            ? Image.asset(
                AppConstants.image.logo,
                width: 52.w,
                height: 52.w,
              )
            : title ??
                (titleText != null
                    ? Text(
                        titleText!,
                        style: Get.theme.textTheme.displayMedium!.copyWith(
                          color: AppColors.light,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontConfig.poppins
                        ),
                      )
                    : null),
        actions: actions,
        elevation: elevation,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: shape,
        toolbarHeight: toolbarHeight ?? 67.h,
        automaticallyImplyLeading: automaticallyImplyLeading,
        titleSpacing: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);

  factory CustomAppBar.withLogoAsTitle({
    Widget? leading,
    List<Widget>? actions,
    bool hasBackButton = true,
  }) {
    return CustomAppBar(
      hasLogoAsTitle: true,
      leading: leading,
      actions: actions,
      hasBackButton: hasBackButton,
      toolbarHeight: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
    );
  }

  factory CustomAppBar.dashboard({
    List<Widget>? actions,
    required VoidCallback onDrawerPressed,
  }) {
    return CustomAppBar(
      hasLogoAsTitle: true,
      leading: AppBackButton(
        onBackPressed: onDrawerPressed,
        icon: Icons.menu,
        iconSize: 20,
      ),
      hasBackButton: false,
      toolbarHeight: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
    );
  }
}
