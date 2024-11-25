import 'dart:io';

import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/features/medical_reports/controllers/report_details_controller.dart';
import 'package:e_medfile/features/medical_reports/widgets/report_detail_header.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/app_chips.dart';
import 'package:e_medfile/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ReportDetailsScreen extends GetView<ReportDetailsController> {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackButton: true,
      titleText: 'Report Details',
      hasHeaderSpacing: false,
      hasHeaderPrefix: true,
      headerPrefix: ReportDetailHeader(controller: controller),
      hasInsideBorder: true,
      outsideBorderPadding: EdgeInsets.zero,
      insideBorderPadding: EdgeInsets.all(23.w),
      body: Column(
        children: [
          Image.file(
            File(
              controller.report.value?.reportImage ?? '',
            ),
            width: 205.w,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => SizedBox(
              height: 318.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.broken_image_rounded,
                        size: 40.w, color: AppColors.greyBorder),
                    Gap(10.w),
                    Text(
                      'Error loading image',
                      style: Get.theme.textTheme.labelMedium!
                          .copyWith(color: AppColors.greyBorder),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
