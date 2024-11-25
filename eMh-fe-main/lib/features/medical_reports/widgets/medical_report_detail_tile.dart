import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/features/medical_reports/controllers/medical_reports_controller.dart';
import 'package:e_medfile/features/medical_reports/models/medical_report.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/app_chips.dart';
import 'package:e_medfile/widgets/touch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicalReportDetailTile extends StatelessWidget {
  const MedicalReportDetailTile({
    required this.report,
    required this.onTap,
  });

  final MedicalReport report;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MedicalReportsController>();

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Stack(
          children: [
            Container(
                // height: 94.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyFadedBorder),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    _getDateWidget(DateTime.now()),
                    Gap(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Report Title',
                            style: Get.theme.textTheme.titleMedium!
                                .copyWith(color: AppColors.darkgreyText)),
                        Row(
                          children: <Widget>[
                            Text(
                              'Report Reason: ',
                              style: Get.theme.textTheme.labelSmall!.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.dark,
                              ),
                            ),
                            Wrap(
                              spacing: 3.w,
                              children: report.reportReasons
                                      ?.map(
                                        (reason) => AppChips(
                                          text: reason,
                                          fontSize: 7.sp,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 Report',
                              style: Get.theme.textTheme.labelSmall!.copyWith(
                                fontSize: 9.sp,
                                color: AppColors.dark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 125.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.5.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _getClickableImage(
                                    AppConstants.image.delete,
                                    onTap: () => controller
                                        .deleteReport(report.reportId),
                                  ),
                                  Gap(6.w),
                                  Container(
                                    height: 8.h,
                                    width: 1.w,
                                    color: AppColors.greyFadedBorder,
                                  ),
                                  Gap(6.w),
                                  _getClickableImage(
                                    AppConstants.image.download,
                                    onTap: () => controller
                                        .downloadReport(report.reportId),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Text(
                  'Doctor Name',
                  textAlign: TextAlign.center,
                  style:
                      Get.theme.textTheme.labelSmall!.copyWith(fontSize: 9.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getClickableImage(String image, {required VoidCallback onTap}) {
    return TouchWidget(
      onTap: onTap,
      padding: EdgeInsets.all(5.r),
      borderRadius: BorderRadius.circular(50.r),
      child: Image.asset(
        image,
        width: 10.r,
        height: 10.r,
      ),
    );
  }

  Widget _getDateWidget(DateTime date) {
    return Container(
        width: 55.w,
        height: 55.w,
        // padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.greyFadedBorder)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: Get.theme.textTheme.headlineLarge!
                    .copyWith(color: AppColors.dark),
              ),
              Text(
                DateFormat.MMM(Get.locale).format(date),
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(color: AppColors.greyText),
              )
            ],
          ),
        ));
  }
}
