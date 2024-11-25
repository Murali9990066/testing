import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NoMedicalReportsFound extends StatelessWidget {
  const NoMedicalReportsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppConstants.image.healthReport,
                width: 102.w, height: 102.h),
            Gap(30.h),
            Text(
              'Add a medical report',
              style: Get.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.dark,
              ),
            ),
            Gap(5.h),
            Text(
              'A detailed health history helps a doctor diagnose you better',
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.labelMedium!.copyWith(
                  color: AppColors.darkgreyText, fontWeight: FontWeight.w400),
            ),
            Gap(100.h),
          ],
        ),
      ),
    );
  }
}
