import 'package:e_medfile/features/auth/controllers/otp_verification_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/appbar/custom_appbar.dart';
import 'package:e_medfile/widgets/buttons/app_button.dart';
import 'package:e_medfile/widgets/clickable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OTPVerificationScreen extends GetView<OTPVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomAppBar(
                titleText: 'OTP Verification',
                hasBackButton: true,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 45.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter the 6-digits OTP sent to  ',
                        style: Get.theme.textTheme.headlineLarge!.copyWith(
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w100),
                      ),
                      Gap(8.h),
                      Text(
                        controller.getContactInfo(),
                        style: Get.theme.textTheme.headlineLarge!.copyWith(
                            color: AppColors.dark, fontWeight: FontWeight.bold),
                      ),
                      Gap(25.h),
                      Align(
                        alignment: Alignment.center,
                        child: OtpTextField(
                          margin: EdgeInsets.symmetric(horizontal: 3.7.w),
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          alignment: Alignment.center,
                          numberOfFields: 6,
                          borderRadius: BorderRadius.circular(12),
                          fieldWidth: 45.w,
                          fieldHeight: 45.h,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textStyle: Get.theme.textTheme.headlineLarge!
                              .copyWith(
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.bold),
                          borderColor: AppColors.greyFadedBorder,
                          focusedBorderColor: AppColors.primary,
                          showCursor: false,
                          showFieldAsBox: false,
                          autoFocus: true,
                          onSubmit: (code) {
                            controller.setOtp(code);
                          },
                          onCodeChanged: (code) => controller.setOtp(code),
                          hasCustomInputDecoration: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                  color: AppColors.greyFadedBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                  color: AppColors.secondary, width: 2),
                            ),
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 8.h,
                            ),
                          ),
                        ),
                      ),
                      Obx(() {
                        if (controller.otpErrorText.value.isNotEmpty) {
                          return Column(
                            children: [
                              Gap(8.h),
                              Text(
                                controller.otpErrorText.value,
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.errorText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                      Gap(25.h),
                      Row(
                        children: [
                          Text(
                            'Didn\'t receive the OTP?',
                            style: Get.theme.textTheme.labelMedium!
                                .copyWith(color: AppColors.greyBorder),
                          ),
                          Obx(() => ClickableText(
                                '  Resend',
                                onPressed: controller.isResendEnabled.value
                                    ? () => controller.resendOTP()
                                    : () {},
                                style: Get.theme.textTheme.labelMedium!
                                    .copyWith(
                                        color: controller.isResendEnabled.value
                                            ? AppColors.secondary
                                            : AppColors.greyBorder),
                              )),
                          const Spacer(),
                          Obx(() => Text(
                                controller.isResendEnabled.value
                                    ? ""
                                    : '${controller.otpResendTimer.value}s',
                                style: Get.theme.textTheme.labelMedium!
                                    .copyWith(color: AppColors.secondary),
                              )),
                        ],
                      ),
                      const Spacer(),
                      Obx(() => AppButton.text(
                            text: 'Continue',
                            onPressed: controller.isContinueButtonEnabled.value
                                ? () => controller.continueToNextScreen()
                                : () {},
                            isEnabled: controller.isContinueButtonEnabled.value,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
