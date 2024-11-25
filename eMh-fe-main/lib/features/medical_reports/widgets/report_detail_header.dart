import 'package:e_medfile/features/medical_reports/controllers/report_details_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/app_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ReportDetailHeader extends StatelessWidget {
  const ReportDetailHeader({
    super.key,
    required this.controller,
  });

  final ReportDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Report for ${controller.report.value?.patientName}',
                  style: Get.theme.textTheme.labelMedium!
                      .copyWith(color: AppColors.dark)),
              Text('${controller.report.value?.date}',
                  style: Get.theme.textTheme.labelSmall!
                      .copyWith(fontSize: 8.sp, color: AppColors.dark)),
            ],
          ),
          Gap(5.h),
          Text('Doctor Name: ${controller.report.value?.doctorName}',
              style: Get.theme.textTheme.labelSmall!
                  .copyWith(fontSize: 10.sp, color: AppColors.dark)),
          Gap(5.h),
          Row(
            children: <Widget>[
              Text('Report Reason: ',
                  style: Get.theme.textTheme.labelSmall!
                      .copyWith(fontSize: 10.sp, color: AppColors.dark)),
              Wrap(
                spacing: 3.w,
                children: controller.report.value?.reportReasons
                    ?.map((reason) => AppChips(text: reason, fontSize: 7.sp))
                    .toList() ?? [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}