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

import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});
  final languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar.withLogoAsTitle(
        hasBackButton: true,
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
          const Spacer(),
          SingleChildScrollView(
            child: Container(
              // heightr: 326.h,
              width: 360.w,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
              decoration: BoxDecoration(
                color: AppColors.light,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(35.r)),
              ),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: Get.theme.textTheme.headlineLarge
                          ?.copyWith(color: AppColors.dark),
                    ),
                    Gap(18.h),
                    CustomTextField(
                      focusNode: controller.emailOrPhoneFocusNode.value,
                      controller: controller.emailOrPhoneController.value,
                      hintText: 'Email / Mobile Number',
                      keyboardType: TextInputType.emailAddress,
                      borderSide:
                          const BorderSide(color: AppColors.greyFadedBorder),
                      onChanged: (value) =>
                          controller.onEmailOrPhoneFieldChanged(),
                      errorText: controller.emailOrPhoneErrorText.value,
                    ),
                    Gap(20.h),
                    Gap(63.h),
                    AppButton.text(
                      isEnabled: controller.isLoginButtonEnabled.value,
                      text: 'Login',
                      onPressed: () => controller.login(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
