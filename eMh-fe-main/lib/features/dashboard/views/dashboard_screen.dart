import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/features/dashboard/controllers/dashboard_controller.dart';
import 'package:e_medfile/features/dashboard/views/family_tab_view.dart';
import 'package:e_medfile/features/dashboard/views/medical_tab_view.dart';
import 'package:e_medfile/features/dashboard/views/personal_tab_view.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:e_medfile/widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/appbar/custom_appbar.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      key: controller.scaffoldKey,
      appBar: CustomAppBar.dashboard(
        onDrawerPressed: () => controller.toggleDrawer(),
      ),
      drawer: AppDrawer.dashboard(),
      body: Center(
        child: Column(
          children: [
            _profileBox(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: _dashboardTabBar(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _profileBox() {
    return Container(
            width: Get.width,
            height: 89.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppConstants.image.avatar,
                  width: 44.w,
                  height: 44.w,
                  fit: BoxFit.fitHeight,
                ),
                Gap(10.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome',
                        style: Get.textTheme.titleSmall!.copyWith(
                            color: AppColors.light,
                            fontWeight: FontWeight.w400),
                      ),
                      Gap(4.h),
                      Text(
                        'Manjunatha',
                        style: Get.textTheme.displayLarge!
                            .copyWith(fontFamily: FontConfig.poppins),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget _dashboardTabBar() {
    return DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      // padding: EdgeInsets.symmetric(horizontal: 10.w),
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: -15.w, vertical: 5.h),
                      labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      labelStyle: Get.textTheme.labelSmall!
                          .copyWith(color: AppColors.light),
                      unselectedLabelStyle: Get.textTheme.labelSmall!
                          .copyWith(color: AppColors.dark),
                      // isScrollable: true,
                      dividerColor: AppColors.greyFadedBorder,
                      tabs: const [
                        Tab(
                          text: 'Personal',
                        ),
                        Tab(
                          text: 'Medical',
                        ),
                        Tab(
                          text: 'Family',
                        ),
                      ],
                    ),
                    Gap(26.h),
                    Expanded(
                      child: const TabBarView(
                        children: [
                          PersonalTabView(),
                          MedicalTabView(),
                          FamilyTabView(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
