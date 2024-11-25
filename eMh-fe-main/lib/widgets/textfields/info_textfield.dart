import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.focusNode,
    required this.isFieldEnabled,
    this.onAddIconPressed,
    this.isAddIconEnabled = true,
    this.isTextField = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final RxBool isFieldEnabled;
  final String hintText;
  final String labelText;
  final VoidCallback? onAddIconPressed;
  final bool isAddIconEnabled;
  final bool isTextField;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasFocus = focusNode.hasFocus.obs;
      final isEmpty = controller.text.isEmpty.obs;

      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: hasFocus.value ? AppColors.primary : AppColors.greyBorder,
            width: hasFocus.value ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Expanded(
              child: Focus(
                onFocusChange: (focus) {
                  hasFocus.value = focus;
                  isEmpty.value = controller.text.isEmpty;
                  if (!focus) {
                    // Close keyboard when focus is lost
                    FocusScope.of(context).unfocus();
                  }
                },
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: isFieldEnabled.value && isTextField,
                  style: Get.theme.textTheme.headlineMedium!.copyWith(
                    color: AppColors.dark,
                    fontFamily: FontConfig.poppins,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    labelText: labelText,
                    labelStyle: Get.theme.textTheme.labelLarge!
                        .copyWith(color: AppColors.darkPrimaryText),
                    hintStyle: Get.theme.textTheme.labelLarge!.copyWith(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (_) => isEmpty.value = controller.text.isEmpty,
                ),
              ),
            ),
            if ((isEmpty.value && !hasFocus.value) || !isTextField)
              IconButton(
                onPressed: isAddIconEnabled
                    ? () {
                        isFieldEnabled.value = true;
                        if (isTextField) {
                          focusNode.requestFocus();
                          hasFocus.value = true;
                          isEmpty.value = controller.text.isEmpty;
                        } else if (!isTextField && onAddIconPressed != null) {
                          onAddIconPressed!();
                          hasFocus.value = true;
                        }
                      }
                    : null,
                icon: Icon(Icons.add_circle_rounded, color: AppColors.primary),
              )
          ],
        ),
      );
    });
  }

  factory InfoTextField.simple({
    required TextEditingController controller,
    required FocusNode focusNode,
    required RxBool isFieldEnabled,
    required String hintText,
    required String labelText,
    bool isAddIconEnabled = true,
  }) {
    return InfoTextField(
      controller: controller,
      focusNode: focusNode,
      isFieldEnabled: isFieldEnabled,
      hintText: hintText,
      labelText: labelText,
      isAddIconEnabled: isAddIconEnabled,
    );
  }

  factory InfoTextField.openBottomSheet({
    required TextEditingController controller,
    required FocusNode focusNode,
    required RxBool isFieldEnabled,
    required String hintText,
    required String labelText,
    required VoidCallback onAddIconPressed,
    bool isAddIconEnabled = true,
  }) {
    return InfoTextField(
      controller: controller,
      focusNode: focusNode,
      isFieldEnabled: isFieldEnabled,
      hintText: hintText,
      labelText: labelText,
      onAddIconPressed: onAddIconPressed,
      isAddIconEnabled: isAddIconEnabled,
      isTextField: false,
    );
  }
}
