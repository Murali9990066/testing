import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/buttons/app_button.dart';
import 'package:e_medfile/widgets/clickable_text.dart';
import 'package:e_medfile/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class WelcomeScreenWithTextfield extends StatelessWidget {
  final bool hasHiText;
  final bool isSkippable;
  final VoidCallback onSkipPressed;
  final String title;
  final bool hasTextfield;
  final String hintText;
  final Function(String) onTextfieldInputChange;
  final TextEditingController textFieldController;
  final FocusNode textFieldFocusNode;
  final String buttonText;
  final RxBool isButtonEnabled;
  final VoidCallback onButtonPressed;
  final String textUnderButton;
  final EdgeInsets? padding;
  final TextInputType textInputType;

  WelcomeScreenWithTextfield({
    this.padding,
    this.hasHiText = true,
    this.isSkippable = false,
    this.title = '',
    this.buttonText = '',
    this.hasTextfield = true,
    this.hintText = '',
    required this.textFieldController,
    required this.textFieldFocusNode,
    required this.onTextfieldInputChange,
    required this.isButtonEnabled,
    required this.onButtonPressed,
    required this.onSkipPressed,
    this.textUnderButton = '',
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: padding ?? EdgeInsets.all(25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isSkippable) ...[
              Gap(14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClickableText(
                    'Skip',
                    onPressed: onSkipPressed,
                    style: Get.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              Gap(13.h),
            ] else
              Gap(84.h),
            if (hasHiText)
              Text(
                'Hi',
                style: Get.textTheme.displayLarge!.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            Gap(8.h),
            Text(
              title,
              style: Get.textTheme.displayLarge!.copyWith(
                color: AppColors.light,
              ),
            ),
            Gap(40.h),
            if (hasTextfield)
              CustomTextField.simple(
                focusNode: textFieldFocusNode,
                controller: textFieldController,
                hintText: hintText,
                onChanged: onTextfieldInputChange,
                keyboardType: textInputType,
              ),
            Spacer(),
            Obx(() => AppButton.text(
                  text: buttonText,
                  textStyle: Get.textTheme.labelLarge!.copyWith(
                    color: AppColors.primary,
                  ),
                  onPressed: onButtonPressed,
                  isEnabled: isButtonEnabled.value,
                  color: AppColors.light,
                  textColor: AppColors.primary,
                  highlightColor: AppColors.dark.withOpacity(0.1),
                )),
          ],
        ),
      ),
    );
  }
}
