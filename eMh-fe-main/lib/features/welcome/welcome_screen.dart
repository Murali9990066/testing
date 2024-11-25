import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/features/welcome/controllers/welcome_screen_controller.dart';
import 'package:e_medfile/features/welcome/welcome_screen_with_textfield.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Helpers.delayRedirection(
      action: () => Get.off(
        WelcomeScreenWithTextfield(
          title: controller.nameScreenTitle,
          buttonText: controller.nameScreenButtonText,
          isButtonEnabled: controller.isNameButtonEnabled,
          hintText: controller.nameTextFieldHintText,
          textFieldController: controller.nameTextFieldController,
          textFieldFocusNode: controller.nameTextFieldFocusNode,
          onTextfieldInputChange: controller.onNameTextFieldInputChange,
          onButtonPressed: controller.onNameScreenButtonPressed,
          isSkippable: controller.isNameScreenSkippable,
          onSkipPressed: controller.onSkipPressed,
        ),
      ),
      duration: const Duration(seconds: 5),
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppConstants.image.welcome, height: 43.h, width: 61.h),
            Gap(20.h),
            Text(
              'Welcome to E - Medfile',
              style: Get.textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
