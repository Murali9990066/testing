import 'dart:ui';

import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:e_medfile/widgets/appbar/custom_appbar.dart';
import 'package:e_medfile/widgets/clickable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'touch_widget.dart';

class AppScaffold extends StatelessWidget {
  final bool resizeToAvoidBottomInset;
  final Widget body;
  final String? titleText;
  final String? actionText;
  final VoidCallback? onActionTextTap;
  final PreferredSizeWidget? appBar;
  final bool hasBackButton;
  final bool hasDrawer;
  final bool hasInsideBorder;
  final EdgeInsets? insideBorderPadding;
  final EdgeInsets? outsideBorderPadding;
  final bool isInsideBorderExpanded;
  final bool hasBottomNavigationBar;
  final bool hasFloatingActionButton;
  final bool hasHeaderSpacing;
  final bool hasHeaderPrefix;
  final Widget? headerPrefix;
  final EdgeInsets? contentPadding;
  AppScaffold({
    this.resizeToAvoidBottomInset = true,
    this.titleText,
    this.actionText,
    this.onActionTextTap,
    required this.body,
    this.appBar,
    this.hasBackButton = false,
    this.hasDrawer = false,
    this.hasInsideBorder = false,
    this.isInsideBorderExpanded = false,
    this.insideBorderPadding,
    this.outsideBorderPadding,
    this.hasBottomNavigationBar = false,
    this.hasFloatingActionButton = false,
    this.hasHeaderSpacing = true,
    this.hasHeaderPrefix = false,
    this.headerPrefix,
    this.contentPadding,
  }) : assert(!hasHeaderPrefix || headerPrefix != null,
            'If hasHeaderPrefix is true, a non-empty headerPrefix must be provided');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              titleText: titleText,
              hasBackButton: hasBackButton,
              toolbarHeight: 60.h,
              actions: [
                if (actionText != null && actionText!.isNotEmpty)
                  ClickableText(
                    actionText!,
                    onPressed: onActionTextTap ?? () {},
                    style: Get.theme.textTheme.displayMedium!.copyWith(
                      color: AppColors.light,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontConfig.poppins,
                    ),
                  )
              ],
            ),
            if (hasHeaderSpacing) Gap(59.h),
            Expanded(
              child: Container(
                padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                decoration: BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  children: [
                    if (hasHeaderPrefix) ...[headerPrefix!, Gap(5.h)],
                    if (hasInsideBorder)
                      isInsideBorderExpanded
                        ? Expanded(
                            child: _wrapInsideBorder(
                              body,
                              insideBorderPadding: insideBorderPadding,
                              outsideBorderPadding: outsideBorderPadding,
                            ),
                          )
                        : _wrapInsideBorder(
                            body,
                            insideBorderPadding: insideBorderPadding,
                            outsideBorderPadding: outsideBorderPadding,
                          )
                    else
                      Expanded(child: body),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _wrapInsideBorder(Widget body, {EdgeInsets? insideBorderPadding, EdgeInsets? outsideBorderPadding}) {
    return Container(
      padding: outsideBorderPadding ?? EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: AppColors.light,
        border: Border.all(color: AppColors.greyFadedBorder),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: insideBorderPadding ?? EdgeInsets.zero,
        child: body,
      ),
    );
  }
}
