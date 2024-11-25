import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NoSearchResultFound extends StatelessWidget {
  const NoSearchResultFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 96.h,
                width: 96.w,
                child: Center(
                  child: Image.asset(
                    AppConstants.image.search,
                    height: 55.h,
                    width: 55.w,
                  ),
                ),
              ),
              Text(
                'No results found',
                style: Get.theme.textTheme.titleLarge!.copyWith(
                  color: AppColors.dark,
                ),
              ),
              Gap(20.h),
            ],
          ),
        ),
      ],
    );
  }
}
