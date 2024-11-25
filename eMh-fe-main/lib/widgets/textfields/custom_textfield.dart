import 'package:e_medfile/features/country_code_picker/country_code_picker.dart';
import 'package:e_medfile/features/country_code_picker/country_code_picker_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/buttons/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextField extends TextFormField {
  CustomTextField({
    super.key,
    required super.controller,
    required super.focusNode,
    Color? color,
    String? hintText,
    String? labelText,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    FloatingLabelBehavior? floatingLabelBehavior,
    TextStyle? textStyle,
    super.obscureText = false,
    super.enabled = true,
    super.keyboardType = TextInputType.text,
    super.onChanged,
    super.validator,
    Widget? suffix,
    Widget? prefix,
    Widget? prefixIcon,
    Widget? suffixIcon,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
    InputBorder? inputBorderStyle,
    super.showCursor,
    super.cursorRadius,
    super.cursorColor,
    double? cursorWidth,
    super.cursorHeight,
    InputBorder? focusedInputBorderStyle,
    String? errorText,
    super.inputFormatters, // Add this parameter
  }) : super(
          style: textStyle ?? TextStyle(color: color),
          decoration: InputDecoration(
            errorText: errorText,
            contentPadding: padding ??
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            suffix: suffix,
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIconConstraints: suffixIconConstraints,
            hintText: hintText,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.always,
            hintStyle: hintStyle ??
                Get.theme.textTheme.labelMedium!
                    .copyWith(color: AppColors.greyText),
            labelText: labelText,
            labelStyle: labelStyle,
            border: inputBorderStyle ??
                OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: borderSide ??
                      const BorderSide(color: AppColors.greyBorder),
                ),
            enabledBorder: inputBorderStyle ??
                OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: borderSide ??
                      const BorderSide(color: AppColors.greyBorder),
                ),
            disabledBorder: inputBorderStyle ??
                OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: borderSide ??
                      const BorderSide(color: AppColors.greyBorder),
                ),
            focusedBorder: focusedInputBorderStyle ??
                inputBorderStyle ??
                OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2),
                ),
            errorBorder: errorText != null
                ? OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  )
                : null,
            focusedErrorBorder: errorText != null
                ? OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  )
                : null,
          ),
          cursorWidth: cursorWidth ?? 2.0,
          selectionControls: MaterialTextSelectionControls(), // Add this line
        );

  factory CustomTextField.phone({
    required TextEditingController controller,
    required FocusNode focusNode,
    required Color color,
    required CountryCodePickerController countryCodeController,
    required VoidCallback onCountryCodeWidgetChanged,
    required VoidCallback onCountryCodeWidgetTap,
    required ValueChanged<String> onChanged,
    String hintText = 'Mobile Number',
    String labelText = '',
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    bool? showCursor,
    Radius? cursorRadius,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    String? errorText,
  }) {
    return CustomTextField(
      controller: controller,
      color: color,
      focusNode: focusNode,
      hintText: hintText,
      labelText: labelText,
      hintStyle: hintStyle,
      labelStyle: labelStyle,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      textStyle: textStyle,
      keyboardType: TextInputType.phone,
      prefixIcon: CountryCodePicker(
        controller: countryCodeController,
        onChanged: onCountryCodeWidgetChanged,
        onTap: onCountryCodeWidgetTap,
      ),
      borderRadius: borderRadius,
      showCursor: showCursor,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      errorText: errorText,
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10)
      ], // Limit to 10 digits
    );
  }

  factory CustomTextField.simple({
    required TextEditingController controller,
    required FocusNode focusNode,
    String hintText = '',
    String labelText = '',
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool enabled = true,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    String? errorText,
    Color? borderColor,
    Color? hintTextColor,
    Color? labelTextColor,
  }) {
    return CustomTextField(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: hintTextColor ?? AppColors.lightGreyText),
      labelStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: labelTextColor ?? AppColors.lightGreyText),
      textStyle:
          Get.theme.textTheme.labelLarge!.copyWith(color: AppColors.light),
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      inputBorderStyle: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.light),
      ),
      focusedInputBorderStyle: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.light, width: 2),
      ),
      cursorColor: AppColors.light,
      errorText: errorText,
    );
  }

  factory CustomTextField.bordered({
    required TextEditingController controller,
    required FocusNode focusNode,
    String hintText = 'Hint Text',
    String labelText = '',
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool enabled = true,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    String? errorText,
    Color? borderColor,
    Color? hintTextColor,
    Color? labelTextColor,
    BorderRadius? borderRadius,
  }) {
    return CustomTextField(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      labelText: labelText,
      hintStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: hintTextColor ?? AppColors.greyFadedBorder),
      labelStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: labelTextColor ?? AppColors.greyFadedBorder),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      errorText: errorText,
      inputBorderStyle: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.greyFadedBorder),
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
      ),
      focusedInputBorderStyle: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
      ),
      borderRadius: borderRadius,
    );
  }

  factory CustomTextField.addInfo({
    required TextEditingController controller,
    required FocusNode focusNode,
    String hintText = 'Hint Text',
    String labelText = 'Label Text',
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool enabled = true,
    required Function(String)? onChanged,
    String? Function(String?)? validator,
    String? errorText,
    VoidCallback? onAddPressed,
  }) {
    return CustomTextField(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      hintStyle:
          Get.theme.textTheme.labelLarge!.copyWith(color: AppColors.dark),
      labelText: labelText,
      labelStyle:
          Get.theme.textTheme.labelLarge!.copyWith(color: AppColors.dark),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      errorText: errorText,
      suffixIcon: IconButton(
        icon: Icon(
          Icons.add_circle_rounded,
          color: AppColors.primary,
        ),
        onPressed: onAddPressed, // Ensure this is set correctly
      ),
      // borderSide: BorderSide.none,
    );
  }

  factory CustomTextField.search({
    required TextEditingController controller,
    required FocusNode focusNode,
    String hintText = 'Search',
    // String labelText = 'Search',
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool enabled = true,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    String? errorText,
    double iconSize = 16,
    bool hasResetFieldButton = true,
    required RxBool isSearchModeEnabled,
  }) {
    return CustomTextField(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      // labelText: labelText,
      cursorColor: AppColors.greyText,
      cursorWidth: 1,
      prefixIcon:
          Icon(Icons.search_rounded, size: iconSize, color: AppColors.greyText),
      prefixIconConstraints:
          BoxConstraints(maxWidth: iconSize, maxHeight: iconSize),
      suffixIcon: hasResetFieldButton
          ? RoundedIconButton(
              padding: EdgeInsets.zero,
              borderSide: BorderSide.none,
              icon: Icons.close_rounded,
              iconSize: iconSize,
              color: AppColors.greyText,
              onPressed: () {
                focusNode.unfocus();
                isSearchModeEnabled.value = false;
                controller.clear();
              },
            )
          : null,
      suffixIconConstraints:
          BoxConstraints(maxWidth: iconSize, maxHeight: iconSize),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: AppColors.darkgreyText, fontSize: 10.sp),
      labelStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: AppColors.darkgreyText, fontSize: 10.sp),
      textStyle: Get.theme.textTheme.labelLarge!
          .copyWith(color: AppColors.darkgreyText, fontSize: 10.sp),
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      errorText: errorText,
      inputBorderStyle: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedInputBorderStyle: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
    );
  }
}
