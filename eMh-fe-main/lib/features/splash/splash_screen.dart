import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Helpers.delayRedirection(
      action: () => Get.toNamed(Routes.signup.route),
      duration: const Duration(seconds: 5),
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: -20,
            left: -30,
            child: ClipOval(
              child: Container(
                color: AppColors.light.withOpacity(0.3),
                width: 172.16.w,
                height: 172.16.w,
              ),
            ),
          ),
          Positioned(
            bottom: -70,
            right: -70,
            child: ClipOval(
              child: Container(
                color: AppColors.light.withOpacity(0.3),
                width: 172.16.w,
                height: 172.16.w,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              AppConstants.image.logo,
              width: 120.w,
              height: 120.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
