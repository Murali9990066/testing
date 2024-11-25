import 'package:e_medfile/features/auth/controllers/signup_controller.dart';
import 'package:e_medfile/features/country_code_picker/country_code_picker_controller.dart';
import 'package:e_medfile/features/language/language_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/appbar/custom_appbar.dart';
import 'package:e_medfile/widgets/buttons/app_button.dart';
import 'package:e_medfile/widgets/buttons/language_drodown_button.dart';
import 'package:e_medfile/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({super.key});
  final languageController = Get.find<LanguageController>();
  final countryCodeController = Get.find<CountryCodePickerController>(); // Get the singleton instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar.withLogoAsTitle(
        hasBackButton: false,
        actions: [
          LanguageDropdownButton(languageController: languageController),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: Center(
              child: Text(
                'Your Health file, simplified!!!',
                style: Get.theme.textTheme.displayLarge,
              ),
            ),
          ),
          Spacer(),
          SingleChildScrollView(
            child: Container(
              height: 326.h,
              width: 360.w,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
              decoration: BoxDecoration(
                color: AppColors.light,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(35.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s Get Started!',
                    style: Get.theme.textTheme.headlineLarge
                        ?.copyWith(color: AppColors.dark),
                  ),
                  Gap(3.h),
                  Text(
                    'Enter your mobile number',
                    style: Get.theme.textTheme.labelLarge
                        ?.copyWith(color: AppColors.greyText),
                  ),
                  Gap(20.h),
              
                  // create a custom phone number input field
                  SizedBox(
                    width: Get.width.w,
                    child: Obx(() => CustomTextField.phone(
                      color: AppColors.dark,
                      controller: controller.phoneController.value,
                      focusNode: controller.phoneFocusNode.value,
                      countryCodeController: countryCodeController, // Pass the singleton instance
                      errorText: controller.phoneErrorText.value, // Use the error text from the controller
                      onCountryCodeWidgetTap: () =>
                          controller.unfocusPhoneField(),
                      onCountryCodeWidgetChanged: () {
                        controller.changeCountryCode(controller
                            .countryCodeController
                            .value
                            .pickedCountryCode
                            .value
                            .codeWithPlus);
                      },
                      onChanged: controller.onPhoneChanged, // Add this line
                    )),
                  ),
                  // Gap(63.h),
                  const Spacer(),
                  Obx(() => AppButton.text(
                        text: 'Continue',
                        onPressed: () => controller.continueSignup(),
                        isEnabled: controller.isContinueButtonEnabled.value,
                      )),
                  Gap(10.h),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                          color: AppColors.darkPrimaryText,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextButton(
                        // style: TextButton.styleFrom(
                        //   padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.h),
                        // ),
                        onPressed: () => controller.navigateToLogin(),
                        child: Text('Login',
                            style: Get.theme.textTheme.labelMedium!
                                .copyWith(color: AppColors.primary)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
